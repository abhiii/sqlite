//
//  ViewController.m
//  SqliteDemo
//
//  Created by Hadi Hatunoglu on 07/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import "ViewController.h"
#import "FieldsClass.h"
#import "DBClass.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    
    FieldsClass *fieldsObj=[[FieldsClass alloc]init];
    fieldsObj.name=_nameField.text;
    fieldsObj.surname=_surnameField.text;
    DBClass *dbObj=[[DBClass alloc]init];
    [dbObj saveData:fieldsObj];

    
}

- (IBAction)retrieve:(id)sender {
    DBClass *dbObj=[[DBClass alloc]init];
    [dbObj retrieveData];
    
}

- (IBAction)DeleteData:(id)sender {
    DBClass *dbObj=[[DBClass alloc]init];
    [dbObj DeleteData];
}
@end
