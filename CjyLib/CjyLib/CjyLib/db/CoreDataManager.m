//
//  CoreDataManager.m
//  coredata-01
//
//  Created by cjy on 2018/12/27.
//  Copyright © 2018 cjy. All rights reserved.
//

#import "CoreDataManager.h"
@interface CoreDataManager()
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end

@implementation CoreDataManager
+(instancetype)sharedInstance
{
    static CoreDataManager* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CoreDataManager alloc] init];
    });
    return instance;
}
-(id)init
{
    if(self = [super init])
    {
        NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
        if (!coordinator) {
            return nil;
        }
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return self;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    //CoreData是建立在SQLite之上的，数据库名称需与.cdatamodel文件同名
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite"];
    
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    // 加载sqlite数据库文件
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}
//获取沙盒Documents目录中文件的URL
- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    // xcdataModeld文件编译后为momd文件，从资源文件加载NSManagedObjectModel
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    [NSManagedObjectModel mergedModelFromBundles:nil];
    return _managedObjectModel;
}

//添加、删除操作执行后，需要调用该方法保存文件
- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
//第一种插入操作（根据字典传递数据）
-(BOOL)insertObjectWithEntity:(NSString*)entity parameter:(NSDictionary*)param{
    
    NSManagedObject*object=[NSEntityDescription insertNewObjectForEntityForName:entity inManagedObjectContext:self.managedObjectContext];
    
    for (NSString*key in param.allKeys) {
        [object setValue:param[key] forKey:key];
    }
    //[_managedObjectContext save:nil];
    return YES;
}
//查询数据
-(NSArray*)queryWithEntity:(NSString*)entity predicate:(NSPredicate*)predicate sortKey:(NSString*)key ascending:(BOOL)isAscending{
    //创建取回数据请求
    NSFetchRequest*request=[[NSFetchRequest alloc]init];
    //设置检索的实体描述
    NSEntityDescription*entityDes=[NSEntityDescription entityForName:entity inManagedObjectContext:_managedObjectContext];
    [request setEntity:entityDes];
    //谓词，筛选数据
    request.predicate=predicate;
    //指定对检索结果的排序方式
    if ( key ){
        //之所以添加判断，是因为如果key为nil，NSSortDescriptor则无法初始化，程序会奔溃
        NSSortDescriptor*sortDestor=[[NSSortDescriptor alloc]initWithKey:key ascending:isAscending];
        [request setSortDescriptors:@[sortDestor]];
    }
    NSError*error=nil;
    //执行请求，返回数组
    NSArray*fetchedResult=[_managedObjectContext executeFetchRequest:request error:&error];
    if (!fetchedResult) {
        NSLog(@"error:%@ ,%@",error,[error userInfo]);
    }
    
    return fetchedResult;
}
-(BOOL)deleteObject:(NSManagedObject*)object{
    if (object && [object isKindOfClass:[NSManagedObject class]]) {
        [_managedObjectContext deleteObject:object];
        return YES;
    }
    return NO;
}

-(void)save
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
