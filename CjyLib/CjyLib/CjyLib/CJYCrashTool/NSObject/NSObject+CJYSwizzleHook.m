//
//  NSObject+CJYSwizzleHook.m
//  CjyLib
//
//  Created by cjy on 2018/12/19.
//  Copyright © 2018年 cjy. All rights reserved.
//

#import "NSObject+CJYSwizzleHook.h"
#import <objc/runtime.h>
void swizzleMethod(Class cls,BOOL isClassMethod,SEL orignSelector,SEL swizzleSelector)
{
    Method orignM;
    Method swizzleM;
    Class metaClass;
    if (!cls) {
        return;
    }
    
    if(isClassMethod)
    {
        orignM = class_getClassMethod(cls, orignSelector);
        swizzleM = class_getClassMethod(cls, swizzleSelector);
        metaClass = objc_getMetaClass(NSStringFromClass(cls).UTF8String);
    }
    else
    {
        orignM = class_getClassMethod(cls, orignSelector);
        swizzleM = class_getClassMethod(cls, swizzleSelector);
        metaClass = cls;
    }
    
    //class_addMethod(cls, <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
    BOOL isAddResult = class_addMethod(metaClass, orignSelector, method_getImplementation(swizzleM), method_getTypeEncoding(swizzleM));
    if(isAddResult)
    {
        class_replaceMethod(metaClass, swizzleSelector, method_getImplementation(orignM), method_getTypeEncoding(orignM));
    }
    else
    {
        IMP orign =  class_replaceMethod(metaClass, orignSelector, method_getImplementation(swizzleM), method_getTypeEncoding(swizzleM));
        class_replaceMethod(metaClass, swizzleSelector, orign, method_getTypeEncoding(orignM));
    }
    
}
@implementation NSObject (CJYSwizzleHook)
+(void)CJY_swizzleSelfMethodWithIsClassMethod:(BOOL)isClassMethod originSelector:(SEL)originSelector swizzleSelector:(SEL)swizzleSelector
{
    //swizzleMethod([self class],isClassMethod,originSelector,swizzleMethod);
    //swizzleMethod()
    swizzleMethod([self class],isClassMethod,originSelector,swizzleSelector);
}

@end
