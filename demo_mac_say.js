var readline = require('readline');
 
var color = require('colors')
var async = require('async');
var mysql = require('mysql');
var config= require('config');
  if (!config.MYSQL) {
      throw new Error('MYSQL setting missing');
  }
  if (!config.MYSQL.POOL) {
      throw new Error('MYSQL POOL missing');
  }
var pool =  mysql.createPool( config.MYSQL.POOL);

var exec = require('child_process').exec,
    child;

//exec('say 请输入 list 命令获取', function (error, stdout, stderr) { });

var preCmd;
var gid;
var yn='y';
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
console.log('---------welcom------------'.blue);

exec('say 请输入ID开始导诊', function (error, stdout, stderr) { });
console.log('please input the follow IDs to start GUIDE'.blue);
console.log('ID:1 DESC: 睡眠困难');
console.log('ID:2 DESC: 感觉不适');
console.log('list'.red +' --- input to show all guide id '.blue);
rl.setPrompt('Input  the  ID> ');
rl.prompt();

rl.on('line', function(line) {
 
  var l =  line.trim().toLocaleUpperCase();
  
  preCmd=l;
  if(l=='LIST'){
    gid=-1;
    exec('say 请输入ID开始导诊', function (error, stdout, stderr) { });
    console.log('please input the follow IDs to start GUIDE'.blue);
    console.log('ID:1 DESC: 睡眠困难');
    console.log('ID:2 DESC: 感觉不适');
    rl.setPrompt('Input  ther ID> ');
  }

  if(!isNaN(l)){

    gid=l;
    var sql='SELECT * FROM  guids_items where  id in (SELECT item_id FROM  guids_index_items where index_id=?)';
    var par=[gid];
    async.waterfall([
        function( callback) {
            pool.query(sql,par , function(err, rows, fields) {
                 
                 callback(err, rows);
                 
            });
            
        }
    ], function (err, result) {
        if(err){
          console.log('DB Connect Error'.red);
           rl.prompt();
        }
        if(result[0]){
          gid=result[0].id;

          rl.setPrompt('Question:'+result[0].content + '[Y/N]'.red +' >');
          exec('say '+result[0].content, function (error, stdout, stderr) { if(error) throw new Error('say error');})
          rl.prompt();
        }else{
          rl.setPrompt('Choose other ID'.red+' >');
          rl.prompt();
        }
        
    });
  }
  if(l=='Y' || l=='N'){
    l= l=='Y'?'是':'否';
    var sql='SELECT * FROM  guids_items where  id in (SELECT id FROM  guids_items_rel where pid=? ) and pre_text=?'
    sql='SELECT a.* ,(SELECT count(*) c FROM  guids_items_rel where pid=a.id) as c FROM  guids_items a where  a.id in (SELECT id FROM  guids_items_rel where pid=? ) and pre_text=?'
    var par=[gid,l];
    async.waterfall([
        function( callback) {//根据是 否 查询Item
            pool.query(sql,par , function(err, rows, fields) {
                 
                 callback(err, rows);
                 
            });
            
        },// 查询link id 
        function( result, callback) {
          if(result[0]){
            if(result[0].link_id){//link to new question
                gid=result[0].link_id;  
                var sql='SELECT * FROM  guids_items where  id =?'
                var par=[gid];
                pool.query(sql,par , function(err, rows, fields) {
                     var mesg = '';
                     if(rows[0]){ 
                      gid=rows[0].id;
                      mesg=rows[0].content  ;
                       callback(err,mesg,gid,null,1,result[0].content);
                     }else{
                        mesg = 'no data ';
                         callback(err,mesg,gid,null,null,result[0].content );
                     }
                    
                     
                });
             }else{
             // 输出message
               var mesg = '';
               gid=result[0].id;
               mesg= result[0].content  ;
               callback(null,mesg,null,result[0].c,1,result[0].content );
             
            
             }
          }else{//no data
            callback(null,'no data',null,null,null,null);
          }
          
        }
    ], function (err, msg,linkid,isend,flagc,res) {//err, content, linked_id ,end?,msg is notnull
        if(err){
          console.log('DB Connect Error');
           rl.prompt();
        }
        if(linkid){
          exec('say '+res+',下面,开始新的提问'+msg, function (error, stdout, stderr) { if(error) throw new Error('say error'); }) 
 

          rl.setPrompt( 'Answer:'.blue+res );        
          rl.prompt();
          console.log(' ');

          rl.setPrompt( 'changed:'.red   );
          rl.prompt();
          console.log('the question has changed ');

          rl.setPrompt( 'Question:'.red+msg + '[Y/N]'.red +' >');
          rl.prompt();

        }else{
            exec('say '+msg, function (error, stdout, stderr) { });
        	if(isend){
        		rl.setPrompt( 'Question:'.red+msg + '[Y/N]'.red +' >');
                rl.prompt();
        	}else{
        		rl.setPrompt( 'Answer:'.blue+msg );
                rl.prompt();
                console.log(' ');
                rl.setPrompt('Choose other ID'.red+' >');
                rl.prompt();
        	}



        }
        //exec('say '+result, function (error, stdout, stderr) { });
         
       
        rl.prompt();
        
    });
  }
   
  rl.prompt();
}).on('close', function() {
  console.log('o(∩_∩)o  Have a great day! '.blue);
  process.exit(0);
});

 