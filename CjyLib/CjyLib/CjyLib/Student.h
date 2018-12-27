//
//  Student.h
//  CjyLib
//
//  Created by cjy on 2018/12/17.
//  Copyright © 2018年 cjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubStudent.h"
@interface Student : NSObject
@property (nonatomic,copy)NSString* name;
@property (nonatomic,copy)NSArray* list;
@property (nonatomic,strong) SubStudent* stu;
@end
