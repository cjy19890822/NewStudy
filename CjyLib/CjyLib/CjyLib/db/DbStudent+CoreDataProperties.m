//
//  DbStudent+CoreDataProperties.m
//  CjyLib
//
//  Created by 陈靖宜 on 2018/12/29.
//  Copyright © 2018年 cjy. All rights reserved.
//
//

#import "DbStudent+CoreDataProperties.h"

@implementation DbStudent (CoreDataProperties)

+ (NSFetchRequest<DbStudent *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DbStudent"];
}

@dynamic name;

@end
