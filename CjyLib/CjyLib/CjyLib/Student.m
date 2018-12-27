//
//  Student.m
//  CjyLib
//
//  Created by cjy on 2018/12/17.
//  Copyright © 2018年 cjy. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
@implementation Student
// 重写debugDescription, 而不是description

    - (NSString *)description{
        
        NSString *descriptionString = NSStringFromClass([self class]);
        Class tempClass = [self class];
        //循环执行 直到父类循环到 NSObject 为止
        while (tempClass != [NSObject class]) {
            unsigned int count = 0 ;
            //获取属性列表
            objc_property_t *propertyList = class_copyPropertyList(tempClass, &count);
            
            for (int i = 0; i < count; i ++) {
                //取出属性名和值 拼接字符串。
                objc_property_t property = propertyList[i];
                NSString *propertyName = [NSString stringWithUTF8String: property_getName(property)];
                
                NSString *propertyValue = [self valueForKey:propertyName];
                
                NSString *keyValueDic = [NSString stringWithFormat:@" %@--%@, ",propertyName,propertyValue];
                
                descriptionString = [descriptionString stringByAppendingString:keyValueDic];
            }
            free(propertyList);
            //释放指针
            tempClass = [tempClass superclass];
            //指向父类
        }
        return descriptionString;
    }

@end
