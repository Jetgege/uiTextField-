//
//  JETFlagField.m
//  FlagKeyBoard
//
//  Created by Jet on 16/6/10.
//  Copyright © 2016年 Jet. All rights reserved.
//

#import "JETFlagField.h"
#import "Flag.h"
#import "FlagView.h"
@interface JETFlagField ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic,strong) NSMutableArray *flags;
@end
@implementation JETFlagField

#pragma mark-
#pragma mark-懒加载
-(NSMutableArray *)flags{

    if (_flags == nil) {
        
        _flags = [NSMutableArray array];
        
        //1.拿到文件路径
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"flags.plist" ofType:nil];
        //2.根据路径创建JSON数据
        NSArray *dicts = [NSArray arrayWithContentsOfFile:filePath];
        //3.字典转模型
        for (NSDictionary *dict in dicts) {
            id obj = [Flag flagWithDict:dict];
            [_flags addObject:obj];
        }
    }
    return _flags;
}

//只要从xib或者storyboard就会调用awakeFromNib，只会调用一次
-(void)awakeFromNib{
    [self setUP];
}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self setUP];
    }
    return  self;
}
//初始化操作
-(void)setUP{

    //创建键盘
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    //自定义键盘
    self.inputView = pickerView;
    
}

#pragma mark-
#pragma mark-UIPickerViewDataSource
//设置组数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
}
//设置行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return  self.flags.count;
}
#pragma mark-
#pragma mark-UIPickerViewDelegate

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{

    return 100;
}


-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    Flag *flag = self.flags[row];
    FlagView *flagView = [FlagView flagView];
    flagView.flag = flag;
    flagView.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 100);
    return flagView;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    Flag *flag = self.flags[row];
    self.text =flag.name;
}

@end
