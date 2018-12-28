//
//  Child+CoreDataProperties.m
//  
//
//  Created by cjy on 2018/12/28.
//
//

#import "Child+CoreDataProperties.h"

@implementation Child (CoreDataProperties)

+ (NSFetchRequest<Child *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Child"];
}

@dynamic age;

@end
