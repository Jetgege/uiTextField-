//
//  FlagView.h
//  FlagKeyBoard
//
//  Created by Jet on 16/6/10.
//  Copyright © 2016年 Jet. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Flag;
@interface FlagView : UIView

@property(nonatomic,strong)Flag *flag;
+(instancetype)flagView;
@end
