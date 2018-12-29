//
//  Child+CoreDataProperties.h
//  CjyLib
//
//  Created by 陈靖宜 on 2018/12/29.
//  Copyright © 2018年 cjy. All rights reserved.
//
//

#import "Child+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Child (CoreDataProperties)

+ (NSFetchRequest<Child *> *)fetchRequest;

@property (nonatomic) int16_t age;

@end

NS_ASSUME_NONNULL_END
