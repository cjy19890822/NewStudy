//
//  ViewController.m
//  CjyLib
//
//  Created by cjy on 2018/12/16.
//  Copyright © 2018年 cjy. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "CoreDataManager.h"
#import "CJYUserModel.h"
#import "CJYLoginService.h"
#import "FFtoast.h"
#import "Child+CoreDataClass.h"
@interface ViewController ()
//@property(nonatomic,strong) 
@end

@implementation ViewController

- (void)viewDidLoad {
    UIButton* btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, 200, 80, 80);
    btn.backgroundColor = [UIColor yellowColor];
    [btn setTitle:@"add" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIButton* btn1 = [[UIButton alloc] init];
    btn1.frame = CGRectMake(100, 200, 80, 80);
    [btn1 setTitle:@"delete" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor yellowColor];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    UIButton* btn2 = [[UIButton alloc] init];
    btn2.frame = CGRectMake(200, 200, 80, 80);
    [btn2 setTitle:@"modify" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(updateBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn2.backgroundColor = [UIColor yellowColor];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    UIButton* btn3 = [[UIButton alloc] init];
    btn3.frame = CGRectMake(0, 300, 80, 80);
    [btn3 setTitle:@"lookup" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn3.backgroundColor = [UIColor yellowColor];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    
    UIButton* btn4 = [[UIButton alloc] init];
    btn4.frame = CGRectMake(0, 500, 80, 80);
    [btn4 setTitle:@"lookup" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(mrInsert:) forControlEvents:UIControlEventTouchUpInside];
    btn4.backgroundColor = [UIColor yellowColor];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn4];
    
    [super viewDidLoad];
    DLog(@"currentMainUrl:***%@***",MAIN_URL);
    Student* stu = [Student new];
    stu.name =@"cjy";
    stu.list = [NSArray arrayWithObjects:@"wu",@"chen", nil];
    stu.stu = [SubStudent new];
    stu.stu.name = @"substu";
    DLog(@"%@",[stu debugDescription]);
    NSString* str = [[NSString alloc] initWithString:nil];
    CJYUserModel* model = [[CJYUserModel alloc] initWithDic:@{@"name":@"cjy"}];
    [model loginWithName:@"jj"];
    DLog(@"%@",model.name);
    
    CJYLoginService* loginService =  [[CJYLoginService alloc] init];
    [loginService loginWithUser:model];
    DLog(@"%@",loginService.curusermodel.name);
   // [str stringByAppendingString:nil];
   // DLog(@"%@",value);
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)mrInsert:(UIButton*)btn
{
    for(int i = 0 ; i < 10;i ++ )
    {
        Child* child = [Child MR_createEntity];
        child.age = 10;
    }
    NSLog(@"bbb");
   // [[NSManagedObjectContext MR_defaultContext] MR_saveOnlySelfAndWait];
    [NSManagedObjectContext MR_rootSavingContext]
    NSLog(@"aaa");
   // [MagicalRecord saveWithBlock:<#^(NSManagedObjectContext * _Nonnull localContext)block#>]
}
-(NSArray*)query
{
    NSPredicate* pre = [NSPredicate predicateWithFormat:@"name = %@",@"cjy"];
    NSArray*arr =  [[CoreDataManager sharedInstance] queryWithEntity:@"DbStudent" predicate:pre sortKey:@"name" ascending:YES];
    //    NSManagedObjectModel* model = arr.firstObject;
    //    NSLog(@"%@",[model valueForKey:@"name"]);
    return arr;
}


-(void)update
{
    NSArray* arr = [self query];
    NSManagedObjectModel* model = arr.firstObject;
    [model setValue:@"jsk" forKey:@"name"];
    [[CoreDataManager sharedInstance] save];
}
-(void)insert
{
    [[CoreDataManager sharedInstance] insertObjectWithEntity:@"DbStudent" parameter:@{@"name":@"cjy"}];
    [[CoreDataManager sharedInstance] insertObjectWithEntity:@"Child" parameter:@{@"age":@18}];
    [[CoreDataManager sharedInstance] save];
}

-(void)delete
{
    NSArray* arr = [self query];
    if([[CoreDataManager sharedInstance] deleteObject:arr.firstObject])
    {
       // NSLog(@"删除成功");
        [[CoreDataManager sharedInstance] save];
        [FFToast showToastWithTitle:@"delete" message:@"delete suc" iconImage:nil
                                                                     duration:2.0 toastType:FFToastTypeSuccess];
        
    }
}
-(void)addBtn:(UIButton*)btn
{
    [self insert];
}
-(void)updateBtn:(id)sender
{
    [self update];
}
-(void)delete:(id)sender
{
    [self delete];
//    NSArray* arr = [self query];
//    [self delete:arr.firstObject];
}




-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   // [self insert];
    [self delete];
    [[CoreDataManager sharedInstance] save];
//    [[CoreDataManager sharedInstance] insertObjectWithEntity:@"DbStudent" parameter:@{@"name":@"cjy"}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
