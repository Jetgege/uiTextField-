//
//  FlagView.m
//  FlagKeyBoard
//
//  Created by Jet on 16/6/10.
//  Copyright © 2016年 Jet. All rights reserved.
//

#import "FlagView.h"
#import "Flag.h"

@interface FlagView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation FlagView


+(instancetype)flagView{

    return [[NSBundle mainBundle]loadNibNamed:@"FlagView" owner:nil options:nil][0];
}

-(void)setFlag:(Flag *)flag{

    _flag=flag;
    _nameLabel.text = flag.name;

    _iconImageView.image = [UIImage imageNamed:flag.icon];
}
@end
