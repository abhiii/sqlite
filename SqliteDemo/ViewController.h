//
//  ViewController.h
//  SqliteDemo
//
//  Created by Hadi Hatunoglu on 07/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *surnameField;
- (IBAction)save:(id)sender;
- (IBAction)retrieve:(id)sender;
- (IBAction)DeleteData:(id)sender;

@end
