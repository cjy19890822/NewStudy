//
//  NSArray+CJYPreventCrash.m
//  CjyLib
//
//  Created by cjy on 2018/12/19.
//  Copyright © 2018年 cjy. All rights reserved.
//

#import "NSArray+CJYPreventCrash.h"
#import "NSObject+CJYSwizzleHook.h"
@implementation NSArray (CJYPreventCrash)
+(void)initPreventCrash
{
    Class cls = NSClassFromString(@"__NSArrayI");
    DLog(@"%@",NSStringFromClass(cls));
    [cls CJY_swizzleSelfMethodWithIsClassMethod:NO originSelector:@selector(objectAtIndex:) swizzleSelector:@selector(safeObjectAtIndex:)];
   // [NSArray]
}

-(id)safeObjectAtIndex:(NSInteger)index
{
    id value;
    if(index > self.count)
    {
        DLog(@"数组越界了");
        return nil;
    }
    else
    {
        
        id value = [self safeObjectAtIndex:index];
    }
    return value;
}
@end
