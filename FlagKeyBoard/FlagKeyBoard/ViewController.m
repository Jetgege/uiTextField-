//
//  ViewController.m
//  FlagKeyBoard
//
//  Created by Jet on 16/6/10.
//  Copyright © 2016年 Jet. All rights reserved.
//

#import "ViewController.h"
#import "JETFlagField.h"
@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet JETFlagField *flagField;

@property (weak, nonatomic) IBOutlet UITextField *flagTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _flagField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//是否允许用户编辑
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    return NO;
}

@end
