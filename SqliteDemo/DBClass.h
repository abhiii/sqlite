//
//  DBClass.h
//  SqliteDemo
//
//  Created by Hadi Hatunoglu on 07/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FieldsClass.h"
#import <sqlite3.h>
@interface DBClass : NSObject
{
    NSMutableArray *dataArray;
}
+(NSString*)sqlitePath;
-(void)copyDatabaseIfNeeded;
-(void)retrieveData;
-(void)saveData:(FieldsClass *)fieldObjects;
-(void)DeleteData;
@end
