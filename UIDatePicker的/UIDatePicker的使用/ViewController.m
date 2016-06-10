//
//  ViewController.m
//  UIDatePicker的使用
//
//  Created by Jet on 16/4/4.
//  Copyright © 2016年 Jet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;


@property(nonatomic,strong)UIDatePicker *datePicker;

@property(nonatomic,strong)UIToolbar *toolBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self datePicker];
    [self toolBar];
    _textField.inputView=_datePicker;
    _textField.inputAccessoryView=_toolBar;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIToolbar *)toolBar{

    if (nil==_toolBar) {
        
        _toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 0, 44)];
        _toolBar.barTintColor=[UIColor orangeColor];
        
        UIBarButtonItem *cancelItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
        
        UIBarButtonItem *flexSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeContactAdd];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *complete=[[UIBarButtonItem alloc]initWithCustomView:btn];
        
    
        
        _toolBar.items=@[cancelItem,flexSpace,complete];
        
    }
    return _toolBar;
}

-(void)btnClick{

    NSDate *date=_datePicker.date;
    
    NSDateFormatter *dateFromatter=[[NSDateFormatter alloc]init];
    dateFromatter.dateFormat=@"yyyy-MM-dd";
    NSString *dateStr= [dateFromatter stringFromDate:date];
    
    _textField.text=dateStr;
    
    [_textField resignFirstResponder];
    
}

-(void)cancelClick{
 
    [self.view endEditing:YES];
}

-(UIDatePicker *)datePicker{

    if (nil==_datePicker) {
        _datePicker=[[UIDatePicker alloc]init];
        _datePicker.locale=[NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        _datePicker.datePickerMode=UIDatePickerModeDate;
        
        
    }
    return _datePicker;
}

@end
