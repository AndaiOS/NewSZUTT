//
//  DataBaseManager.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/1.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "DataBaseManager.h"
#import "sqlite3.h"
@interface DataBaseManager (){
    sqlite3 * _database;
}
@end
@implementation DataBaseManager

+(DataBaseManager *)instance{
    static dispatch_once_t pred;
    static DataBaseManager * _sharedInstance = nil;
    dispatch_once(&pred , ^{ _sharedInstance = [[self alloc]init];});
    return _sharedInstance;
}
-(id)init{
    self = [super init];
    if(self){
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * documents = [paths objectAtIndex:0];
        NSString * database_path = [documents stringByAppendingPathComponent:@"szutt.db"];
        
        if (sqlite3_open([database_path UTF8String], &_database) != SQLITE_OK) {
            sqlite3_close(_database);
            NSLog(@"数据库打开失败");  
        }
    }
    return self;
}
-(void)insertStudentTable:(Student *)student{
    BOOL flag = [self checkStudentTableisExist];
    if(flag == true){//建立表成功
        //插入数据
        
        NSString * sql2 = @"INSERT INTO student_table(student_id, student_major_name, student_number,student_name,student_nickname,student_password,student_phone,student_email) VALUES(9,'软件工程','2013150007','丘晓波','qqqxb','E10ADC3949BA59ABBE56E057F20F883E','13686416524','361206031@qq.com')";
        
        [self execSql:sql2];
        
        //关闭数据库
        sqlite3_close(_database);
    }
    else{
        
    }
}
-(BOOL)checkStudentTableisExist{
    char * sql =
    "create table if not exists student_table(student_id INTEGER PRIMARY KEY, student_major_name varchar(255),student_number varchar(255),student_name varchar(255),student_nickname varchar(255) , student_password varchar(255) , student_phone varchar(255) , student_email varchar(255))";
    sqlite3_stmt *statement;
    NSInteger sqlReturn = sqlite3_prepare_v2(_database, sql, -1, &statement, nil);
    if(sqlReturn != SQLITE_OK) {
        NSLog(@"Error: failed to prepare statement:create studentTable");
        return false;
    }
    //执行SQL语句
    int success = sqlite3_step(statement);
    //释放sqlite3_stmt
    sqlite3_finalize(statement);
    //执行SQL语句失败
    if ( success != SQLITE_DONE) {
        NSLog(@"Error: failed to dehydrate:create table test");
        return false;
    }
    NSLog(@"Create table 'studentTable' successed.");
    return true;
}


//统一执行插入语句
-(void)execSql:(NSString *)sql
{
    char *err;
    if (sqlite3_exec(_database, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(_database);
        NSLog(@"插入失败");
    }
    else{
        NSLog(@"插入成功");
    }
}
@end
