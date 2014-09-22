//
//  User.h
//  DBCoreData
//
//  Created by dengbin on 14/9/19.
//  Copyright (c) 2014年 IUAIJIA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * account;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * name;

@end
