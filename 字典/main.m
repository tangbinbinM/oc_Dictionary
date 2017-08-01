//
//  main.m
//  字典
//
//  Created by yg on 2017/8/1.
//  Copyright © 2017年 TBB. All rights reserved.
//

#import <Foundation/Foundation.h>

//创建NSDic
void test1(){
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@[@"Daniel", @"30"] forKey:@[@"name",@"age"]];
    NSLog(@"dic:%@",dic);
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Guodh",@"name",@"32",@"age",@"male",@"gender", nil];
    NSLog(@"dic2: %@",dic2);
    NSDictionary *dic3 = @{@"name":@"Guod",@"age":@"16",@"gender":@"male"};
    NSLog(@"dic3 %@",dic3);
}
//使用字典
void test2()
{
    NSDictionary *dict = @{ @"name" : @"Guodenghong", @"age":@35, @"gender":@"male"};
    //使用下标访问key对应的value
    NSString *name = dict[@"name"];
    NSString *gender = [dict objectForKeyedSubscript:@"gender"];
    NSNumber *age = [dict objectForKey:@"age"];
    NSLog(@"%@，%@，%@", name, age, gender);
}
//遍历字典
void test3(){
    NSDictionary *dict = @{ @"name" : @"Guodenghong", @"age":@35, @"gender":@"male"};
    //遍历一
    NSArray *keys = [dict allKeys];
    for (NSString *key in keys) {
        id value = dict[key];
        NSLog(@"%@:%@",key,value);
    }
    //遍历所有value
    NSArray *values = [dict allValues];
    NSLog(@"values: %@",values);
    //使用迭代器(枚举器)
    NSEnumerator *enumerator = [dict keyEnumerator];
    id key = nil;
    while(key = [enumerator nextObject]) {
        id value = dict[key];
        NSLog(@"%@,%@", key, value);
    }
    //使用Block
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"%@:%@", key, obj);
    }];

}
//排序
void test4()
{
    NSDictionary *dict = @{@"Daniel":@10, @"Guodh":@15, @"Mengriri": @5, @"Qinxi":@25};
    NSArray *keys = [dict keysSortedByValueUsingSelector:@selector(compare:)];
    for (NSString *name in keys) {
        NSLog(@"%@,%@", name, dict[name]);
    }
}
//使用NSMutableDictionary
void test5()
{
    NSMutableDictionary *mDict = [NSMutableDictionary new];
    [mDict setObject:@"Daniel" forKey:@"name"];
    [mDict setObject:@"35" forKey:@"age"];
    mDict[@"gender"] = @"male";
    
    NSLog(@"%@", mDict);
    
    mDict[@"age"] = @"36";
    NSLog(@"%@", mDict);
    
    [mDict removeObjectForKey:@"name"];
    //不可以将value赋值为nil
    //mDict[@"age"] = nil;
    NSLog(@"%@", mDict);
    [mDict removeObjectsForKeys:@[@"age", @"gender"]];
    NSLog(@"%@", mDict);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test4();
    }
    return 0;
}
