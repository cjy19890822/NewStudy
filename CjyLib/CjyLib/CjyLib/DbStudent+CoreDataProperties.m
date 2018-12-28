//
//  DbStudent+CoreDataProperties.m
//  
//
//  Created by cjy on 2018/12/28.
//
//

#import "DbStudent+CoreDataProperties.h"

@implementation DbStudent (CoreDataProperties)

+ (NSFetchRequest<DbStudent *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DbStudent"];
}

@dynamic name;

@end
