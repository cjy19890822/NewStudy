//
//  NSString+CJYPreventCrash.m
//  CjyLib
//
//  Created by cjy on 2018/12/19.
//  Copyright © 2018年 cjy. All rights reserved.
//

#import "NSString+CJYPreventCrash.h"
#import <objc/runtime.h>

@implementation NSString (CJYPreventCrash)
+(void)load
{
#if 1
    SEL originalSelector = @selector(initWithString:);
    SEL swizzledSelector = @selector(hyj_swizzleInitWithString:);
#else
    SEL originalSelector = @selector(stringByAppendingString:);
    SEL swizzledSelector = @selector(hyj_swizzleStringByAppendingString:);
#endif
    NSString* str = [NSString alloc];
    Class class = [str class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    NSLog(@"didAddMethod = %d",didAddMethod);
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

}

-(NSString*)hyj_swizzleinitWithUTF8String:(NSString*)aString
{
    if(!aString)
    {
        NSLog(@"交换成功");
    }
    return nil;
}

- (instancetype)hyj_swizzleInitWithString:(NSString *)aString
{
    NSLog(@"666");
    if (aString != nil && aString != NULL) {
        return [self hyj_swizzleInitWithString:aString];
    }else
    {
        //DLog(@"string is nil");
        return nil;
    }
}
@end
