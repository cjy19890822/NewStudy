//
//  CoreDataManager.h
//  coredata-01
//
//  Created by cjy on 2018/12/27.
//  Copyright © 2018 cjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CoreDataManager : NSObject
+(instancetype)sharedInstance;
@property (strong, nonatomic,readonly) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic,readonly) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic,readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
-(BOOL)insertObjectWithEntity:(NSString*)entity parameter:(NSDictionary*)param;
-(NSArray*)queryWithEntity:(NSString*)entity predicate:(NSPredicate*)predicate sortKey:(NSString*)key ascending:(BOOL)isAscending;
-(BOOL)deleteObject:(NSManagedObject*)object;
-(void)save;
@end


