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

var preCmd;
var gid;
var yn='y';
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
console.log('---------welcom------------'.blue);
console.log('list'.red +' --- show all guids id list'.blue);
rl.setPrompt('GUIDS> ');
rl.prompt();

rl.on('line', function(line) {
 
  var l =  line.trim().toLocaleUpperCase();
  
  preCmd=l;
  if(l=='LIST'){
    gid=-1;
    console.log('please input the follow IDs to start GUID'.blue);
    console.log('ID:1 DESC: 疲劳');
    console.log('ID:2 DESC: 感觉不适');
    rl.setPrompt('ID> ');
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

          //console.log(result[0].content + '[Y/N]'.red +'>');
          rl.setPrompt('Question:'+result[0].content + '[Y/N]'.red +' >');
          rl.prompt();
        }else{
          console.log( 'Choose other ID'.red);
          rl.prompt();
        }
        
    });
  }
  if(l=='Y' || l=='N'){
    l= l=='Y'?'是':'否';
    var sql='SELECT * FROM  guids_items where  id in (SELECT id FROM  guids_items_rel where pid=? ) and pre_text=?'
    var par=[gid,l];
    async.waterfall([
        function( callback) {//根据是 否 查询Item
            pool.query(sql,par , function(err, rows, fields) {
                 
                 callback(err, rows);
                 
            });
            
        },
        function( result, callback) {
          if(result[0]){
            if(result[0].link_id){//link to new question
                gid=result[0].link_id;  
                var sql='SELECT * FROM  guids_items where  id =?'
                var par=[gid];
                console.log('ID:'+result[0].id +  result[0].content + '');
                pool.query(sql,par , function(err, rows, fields) {
                     var mesg = '';
                     if(rows[0]){
                      console.log('question is  changed'.red)
                      gid=rows[0].id;
                      mesg='Question:'+'ID:'+gid+  rows[0].content + ' [Y/N]'.red +' >' ;
                     }else{
                        mesg = 'no data ';
                     }
                     callback(err,mesg);
                     
                });
             }else{
             // 输出message
               var mesg = '';
               gid=result[0].id;
               mesg='Question:'+'ID:'+gid+  result[0].content + ' [Y/N]'.red +' >' ;
               callback(null,mesg);
             
            
             }
          }else{//no data
            callback(null,'no data');
          }
          
        }
    ], function (err, result) {
        if(err){
          console.log('DB Connect Error');
           rl.prompt();
        }
        rl.setPrompt( result );
       //console.log(  result  );
       rl.prompt();
        
    });
  }
   
  rl.prompt();
}).on('close', function() {
  console.log('o(∩_∩)o  Have a great day! '.blue);
  process.exit(0);
});

 