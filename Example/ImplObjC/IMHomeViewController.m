//
//  IMHomeViewController.m
//  ImplObjC_Example
//
//  Created by GheniAblez on 2022/7/3.
//  Copyright © 2022 sayiwen. All rights reserved.
//

#import "IMHomeViewController.h"

@interface IMHomeViewController ()

/** 按钮 */
@property (nonatomic,weak) UIButton *goBtn;
@property (nonatomic,weak) UIButton *goBtn2;

@end

@implementation IMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectZero];
    self.goBtn = button;
    self.goBtn2 = button2;
    self.goBtn.backgroundColor = UIColor.greenColor;
    self.goBtn2.backgroundColor = UIColor.blueColor;
    [button setTitle:@"test" forState:UIControlStateNormal];
    [button2 setTitle:@"test1" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goNewPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self.view addSubview:button2];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    IMLayout.layout(self.goBtn)
    .centerYMargin(self.view,100)
    .rightToRightOfMargin(self.view,30)
    //.leftToRightOfMargin(self.goBtn2,15)
    .width(100)
    .install();
    
    IMLayout.layout(self.goBtn2)
    .centerYMargin(self.view,100)
    .leftToLeftOfMargin(self.view,30)
    //.rightToLeftOfMargin(self.goBtn,15)
    .width(100)
    .install();
}

- (void)goNewPage{
    [self presentViewController:[IMHomeViewController new] animated:YES completion:nil];
}


@end
