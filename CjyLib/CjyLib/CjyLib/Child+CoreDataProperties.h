//
//  Child+CoreDataProperties.h
//  
//
//  Created by cjy on 2018/12/28.
//
//

#import "Child+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Child (CoreDataProperties)

+ (NSFetchRequest<Child *> *)fetchRequest;

@property (nonatomic) int16_t age;

@end

NS_ASSUME_NONNULL_END
