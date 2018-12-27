//
//  NSObject+CJYSwizzleHook.h
//  CjyLib
//
//  Created by cjy on 2018/12/19.
//  Copyright © 2018年 cjy. All rights reserved.
//

#import <Foundation/Foundation.h>

void swizzleMethod(Class cls,BOOL isClassMethod,SEL orignSelector,SEL swizzleSelector);
@interface NSObject (CJYSwizzleHook)
/**
 动态交换当前类的 两个方法的实现
 
 @param isClassMethod YES表示需要交换的方法是类方法，NO表示是对象方法
 @param originSelector 原方法名
 @param swizzleSelector 用以交换的方法名
 */
+(void)CJY_swizzleSelfMethodWithIsClassMethod:(BOOL)isClassMethod originSelector:(SEL)originSelector swizzleSelector:(SEL)swizzleSelector;
@end
