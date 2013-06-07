//
//  DBClass.m
//  SqliteDemo
//
//  Created by Hadi Hatunoglu on 07/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import "DBClass.h"
static sqlite3 *database=nil;
@implementation DBClass

+(NSString *)sqlitePath
{
//    NSMutableString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
//
//    [path stringByAppendingPathComponent:@"sample.sqlite"];
//    NSLog(@"db path is %@",path);
//    return path;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
    NSLog(@"%@",documentsDir);
	return [documentsDir stringByAppendingPathComponent:@"sample.sqlite"];

    }



-(void)copyDatabaseIfNeeded
{

    NSFileManager *manager=[NSFileManager defaultManager];
  BOOL filestatus=  [manager fileExistsAtPath:[DBClass sqlitePath]];
    if (filestatus) {
        NSLog(@"file aleady exists");
    }
    else
    {
        NSError *error;
        NSString *appPath=[[NSBundle mainBundle]resourcePath];
        NSString *dbpath=[appPath stringByAppendingPathComponent:@"sample.sqlite"];
       BOOL copyStatus= [manager copyItemAtPath:dbpath toPath:[DBClass sqlitePath] error:&error];
        if (copyStatus) {
            NSLog(@"file successfully coped");
        }
        else{
            NSLog(@"failed to copy");
        }
    }
    
}


-(void)saveData:(FieldsClass *)fieldObjects
{
    
    if (sqlite3_open([[DBClass sqlitePath]UTF8String], &database)==SQLITE_OK) {
        
        NSString *query=[NSString stringWithFormat:@"insert into PersonDetails (name,surname)values (\"%@\",\"%@\")",fieldObjects.name,fieldObjects.surname];
        char *error;
        
        if (sqlite3_exec(database, [query UTF8String],NULL, NULL, &error)==SQLITE_OK) {
            
            NSLog(@"success");
            
        }
        else{
            NSLog(@"fail");

            
        }
        
    }
    
    
}


-(void)retrieveData
{
    dataArray=[[NSMutableArray alloc]init];
    
    if (sqlite3_open([[DBClass sqlitePath]UTF8String], &database)==SQLITE_OK) {
        
        NSString *query=[NSString stringWithFormat:@"select *from PersonDetails"];
        sqlite3_stmt *preparedStmt;
        
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &preparedStmt, NULL)==SQLITE_OK) {
            
            while (sqlite3_step(preparedStmt)==SQLITE_ROW) {
                
                FieldsClass *fileds=[[FieldsClass alloc]init];
                fileds.name=[NSString stringWithUTF8String:(char*) sqlite3_column_text(preparedStmt, 1)];
                fileds.surname=[NSString stringWithUTF8String:(char *) sqlite3_column_text(preparedStmt, 2)];
                [dataArray addObject:fileds];
                NSLog(@"fileds retriueved");
                
                
            }
            
        }
        FieldsClass *fie=[[FieldsClass alloc]init];

        for (int i=0; i<[dataArray count]; i++) {
            fie=[dataArray objectAtIndex:i];
            NSLog(@"the names are %@",fie.name);
            NSLog(@"the surnames are %@",fie.surname);
        }
        
        sqlite3_finalize(preparedStmt);
        sqlite3_close(database);
        
    }
    
}


-(void)DeleteData
{
    if (sqlite3_open([[DBClass sqlitePath]UTF8String], &database)==SQLITE_OK) {
        
        NSString *query=[NSString stringWithFormat:@"Delete from PersonDetails where id=2"];
        char *error;
        if(sqlite3_exec(database, [query UTF8String], NULL, NULL, &error)==SQLITE_OK)
        {
            NSLog(@"success deleted");
        }
        else
        {
            NSLog(@"unable to delete");
        }
    }
}



@end
