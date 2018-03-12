//
//  Student.m
//  DataPersistenceDemo
//
//  Created by Jason on 2018/3/12.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "Student.h"
#define knameKey @"name"
#define kageKey @"age"
#define kweightKey @"weight"
#define khobbyKey @"hobby"
#define kotherKey @"others"

@interface Student ()<NSCopying,NSCoding>
@end

@implementation Student

#pragma mark- NSCoding
//以keyValue形式对基本数据类型Encoding
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    
    [aCoder encodeObject:_name forKey:knameKey];
    [aCoder encodeInt:_age forKey:kageKey];
    [aCoder encodeDouble:_weight forKey:kweightKey];
    [aCoder encodeObject:_hobby forKey:khobbyKey];
    [aCoder encodeObject:_others forKey:kotherKey];
    
}

//以keyValue形式对基本数据类型Decoding，返回数据模型本身
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self == [super init]) {
        _name =  [aDecoder decodeObjectForKey:knameKey];
        _age = [aDecoder decodeIntForKey:kageKey];
        _weight =  [aDecoder decodeDoubleForKey:kweightKey];
        _hobby =  [aDecoder decodeObjectForKey:khobbyKey];
        _others =  [aDecoder decodeObjectForKey:kotherKey];
    }
    
    return self;
}
#pragma mark- NSCopying
//NScopying协议的方法，目的为了实现数据模型的copy
-(id)copyWithZone:(NSZone *)zone{
    Student *copy = [[[self class] allocWithZone:zone] init];
    copy.name = [self.name copyWithZone:zone];
    copy.age = self.age;
    copy.weight = self.weight;
    copy.hobby = [self.hobby copyWithZone:zone];
    copy.others = [self.others copyWithZone:zone];
    
    return copy;
}



@end
