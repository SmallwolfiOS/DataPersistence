//
//  ViewController.m
//  DataPersistenceDemo
//
//  Created by Jason on 2018/3/12.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self getFilePath]]) {
        NSLog(@"filePAth:%@",[self getFilePath]);
        
        NSData *data = [[NSData alloc] initWithContentsOfFile:[self getFilePath]];
        
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        
        //解档出数据模型Student
        Student *mStudent = [unarchiver decodeObjectForKey:@"kDataKey"];
        [unarchiver finishDecoding];//一定不要忘记finishDecoding，否则会报错
    }
    //添加一个广播，用于注册当用户按下home键时，归档数据到闪存中
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveAppDataWhenApplicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}

//返回要保存到闪存的位置
-(NSString *) getFilePath{
    
    NSArray *array =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [[array objectAtIndex:0] stringByAppendingPathComponent:@"fileName"];
    
}
/**
 *当用户按下Home键，返回桌面时，归档当前数据到指定文件路径下
 */
-(void) saveAppDataWhenApplicationWillResignActive:(NSNotification*) notification{
    
    Student *saveStudent = [[Student alloc] init];
    saveStudent.name = @"小明";
    saveStudent.age = 12;
    saveStudent.weight = 145.0;
    saveStudent.hobby = @[@"不知道是谁",@"数组第二个元素"];
    saveStudent.others = @{@"other":@"otherValue"};
    
    NSMutableData *data = [[NSMutableData alloc] init];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:saveStudent forKey:@"kDataKey"];
    
    [archiver finishEncoding];
    
    [data writeToFile:[self getFilePath] atomically:YES];
}
































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
