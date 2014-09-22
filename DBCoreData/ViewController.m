//
//  ViewController.m
//  DBCoreData
//
//  Created by dengbin on 14/9/19.
//  Copyright (c) 2014年 IUAIJIA. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myAppDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];

    

   
    // Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)updateBtnClick
{
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:@"User" inManagedObjectContext:_myAppDelegate.managedObjectContext];
    [request setEntity:user];
    //查询条件
    NSPredicate* predicate=[NSPredicate predicateWithFormat:@"name==%@",@"dengbin"];
    [request setPredicate:predicate];
    NSError* error=nil;
    NSMutableArray* mutableFetchResult=[[_myAppDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult==nil) {
        NSLog(@"Error:%@",error);
    }
    NSLog(@"The count of entry: %ld",[mutableFetchResult count]);
    //更新后要进行保存，否则没更新
    for (User* user in mutableFetchResult)
    {
        [user setPassword:@"hahahaha"];
        
    }
    [_myAppDelegate.managedObjectContext save:&error];
   
}
-(IBAction)deleteBtnClick
{
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:@"User" inManagedObjectContext:_myAppDelegate.managedObjectContext];
    [request setEntity:user];
    NSPredicate* predicate=[NSPredicate predicateWithFormat:@"name==%@",@"dengbin"];
    [request setPredicate:predicate];
    NSError* error=nil;
    NSMutableArray* mutableFetchResult=[[_myAppDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult==nil) {
        NSLog(@"Error:%@",error);
    }
    NSLog(@"The count of entry: %ld",[mutableFetchResult count]);
    for (User* user in mutableFetchResult) {
        [_myAppDelegate.managedObjectContext deleteObject:user];
    }
    
    if ([_myAppDelegate.managedObjectContext save:&error]) {
        NSLog(@"Error:%@,%@",error,[error userInfo]);
    }
}
-(IBAction)findBtnClick
{
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:@"User" inManagedObjectContext:_myAppDelegate.managedObjectContext];
    [request setEntity:user];
    //    NSSortDescriptor* sortDescriptor=[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    //    NSArray* sortDescriptions=[[NSArray alloc] initWithObjects:sortDescriptor, nil];
    //    [request setSortDescriptors:sortDescriptions];
    //    [sortDescriptions release];
    //    [sortDescriptor release];
    NSError* error=nil;
    NSMutableArray* mutableFetchResult=[[_myAppDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult==nil)
    {
        NSLog(@"Error:%@",error);
    }
    NSLog(@"The count of entry: %ld",[mutableFetchResult count]);
    for (User* user in mutableFetchResult) {
        NSLog(@"name:%@----age:%@------sex:%@",user.name,user.account,user.password);
    }
  
}
-(IBAction)insertBtnClick
{
    User* user=(User *)[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.myAppDelegate.managedObjectContext];
    
    [user setName:@"dengbin"];
    [user setAccount:@"123123"];
    [user setPassword:@"111111"];
    NSError* error;
    BOOL isSaveSuccess=[_myAppDelegate.managedObjectContext save:&error];
    if (!isSaveSuccess) {
        NSLog(@"Error:%@",error);
    }else{
        NSLog(@"Save successful!");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
