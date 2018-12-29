//
//  Child+CoreDataProperties.m
//  CjyLib
//
//  Created by 陈靖宜 on 2018/12/29.
//  Copyright © 2018年 cjy. All rights reserved.
//
//

#import "Child+CoreDataProperties.h"

@implementation Child (CoreDataProperties)

+ (NSFetchRequest<Child *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Child"];
}

@dynamic age;

@end
