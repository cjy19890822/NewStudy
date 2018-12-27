//
//  CJYUserModel.h
//  CjyLib
//
//  Created by cjy on 2018/12/25.
//  Copyright © 2018 cjy. All rights reserved.
//

#import "CJYBasicModel.h"

@interface CJYUserModel : CJYBasicModel
@property(nonatomic,copy,readonly) NSString* name;
-(void)loginWithName:(NSString*)name;
@end
