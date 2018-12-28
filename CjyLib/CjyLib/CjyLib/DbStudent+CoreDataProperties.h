//
//  DbStudent+CoreDataProperties.h
//  
//
//  Created by cjy on 2018/12/28.
//
//

#import "DbStudent+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DbStudent (CoreDataProperties)

+ (NSFetchRequest<DbStudent *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
