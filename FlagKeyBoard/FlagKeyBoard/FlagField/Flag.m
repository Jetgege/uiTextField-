//
//  Flag.m
//  FlagKeyBoard
//
//  Created by Jet on 16/6/10.
//  Copyright © 2016年 Jet. All rights reserved.
//

#import "Flag.h"

@implementation Flag

+(instancetype)flagWithDict:(NSDictionary *)dict{

    Flag *flag = [[self alloc]init];    
    [flag setValuesForKeysWithDictionary:dict];
    return flag;
}

@end
