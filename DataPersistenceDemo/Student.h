//
//  Student.h
//  DataPersistenceDemo
//
//  Created by Jason on 2018/3/12.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property(copy,nonatomic) NSString *name;
@property(assign,nonatomic) int age;
@property(assign,nonatomic) double  weight;
@property(copy,nonatomic) NSArray *hobby;
@property(copy,nonatomic) NSDictionary *others;
@end
