//
//  DbStudent+CoreDataProperties.h
//  CjyLib
//
//  Created by 陈靖宜 on 2018/12/29.
//  Copyright © 2018年 cjy. All rights reserved.
//
//

#import "DbStudent+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DbStudent (CoreDataProperties)

+ (NSFetchRequest<DbStudent *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
