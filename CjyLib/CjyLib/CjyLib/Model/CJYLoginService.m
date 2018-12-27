//
//  CJYLoginService.m
//  CjyLib
//
//  Created by cjy on 2018/12/26.
//  Copyright © 2018 cjy. All rights reserved.
//

#import "CJYLoginService.h"
@interface CJYUserModel(Usermodel)
@property(nonatomic,copy,readwrite) NSString* name;
@end

@interface CJYLoginService()
@property(nonatomic,strong,readwrite) CJYUserModel* usermodel;
@end
@implementation CJYLoginService
-(void)loginWithUser:(CJYUserModel *)model
{
    self.usermodel = model;
    self.usermodel.name = model.name;
}

-(CJYUserModel *)curusermodel
{
    return self.usermodel;
}
@end
