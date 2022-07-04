//
//  IMViewController.m
//  ImplObjC
//
//  Created by sayiwen on 07/03/2022.
//  Copyright (c) 2022 sayiwen. All rights reserved.
//

#import "IMViewController.h"
#import "IMHomeViewController.h"

@interface IMViewController ()

@end

@implementation IMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self pushViewController:[IMHomeViewController new] animated:NO];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
