//
//  CJYUserModel.m
//  CjyLib
//
//  Created by cjy on 2018/12/25.
//  Copyright © 2018 cjy. All rights reserved.
//

#import "CJYUserModel.h"
@interface CJYUserModel()
@property(nonatomic,copy,readwrite) NSString* name;
@end
@implementation CJYUserModel
-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if(self)
    {
        _name = dic[@"name"];
    }
    return self;
}

-(void)loginWithName:(NSString*)name
{
    self.name = name;
}
@end
