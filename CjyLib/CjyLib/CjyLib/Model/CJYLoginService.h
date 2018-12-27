//
//  CJYLoginService.h
//  CjyLib
//
//  Created by cjy on 2018/12/26.
//  Copyright © 2018 cjy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJYUserModel.h"
@interface CJYLoginService : CJYBasicModel
@property(nonatomic,strong,readonly)CJYUserModel* curusermodel;
-(void)loginWithUser:(CJYUserModel*)model;
@end
