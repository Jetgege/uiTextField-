//
//  Flag.h
//  FlagKeyBoard
//
//  Created by Jet on 16/6/10.
//  Copyright © 2016年 Jet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *icon;

+(instancetype)flagWithDict:(NSDictionary *)dict;
@end
