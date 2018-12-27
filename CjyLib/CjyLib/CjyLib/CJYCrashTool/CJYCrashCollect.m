//
//  CJYCrashCollect.m
//  CjyLib
//
//  Created by cjy on 2018/12/18.
//  Copyright © 2018年 cjy. All rights reserved.
//

#import "CJYCrashCollect.h"

@implementation CJYCrashCollect
+ (instancetype)sharedInstance
{
    static CJYCrashCollect* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [CJYCrashCollect new];
    });
    return instance;
}

- (void)commitCrashLog:(NSString *)log
{
    NSLog(@"commit log");
}
- (void)installALLPreventCrash
{
    
}

@end
