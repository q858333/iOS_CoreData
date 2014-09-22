//
//  ViewController.h
//  DBCoreData
//
//  Created by dengbin on 14/9/19.
//  Copyright (c) 2014年 IUAIJIA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController

@property(nonatomic,retain)AppDelegate* myAppDelegate;
-(IBAction)insertBtnClick;
-(IBAction)findBtnClick;
-(IBAction)deleteBtnClick;
-(IBAction)updateBtnClick;

@end

