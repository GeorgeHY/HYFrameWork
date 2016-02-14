//
//  TestViewController.m
//  HYFrameWork
//
//  Created by GE on 16/2/14.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    
}

- (void) createUI {
    WEAK_SELF(weakSelf);
    UILabel * displayLabel = [UILabel new];
    [self.view addSubview:displayLabel];
    [displayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left).with.offset(RECTFIX_WIDTH(100));
        make.top.mas_equalTo(weakSelf.view.mas_top).with.offset(RECTFIX_HEIGHT(200));
        make.size.mas_equalTo(CGSizeMake(RECTFIX_WIDTH(100), RECTFIX_HEIGHT(50)));
    }];
    displayLabel.text = @"过年好";
    
}
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
