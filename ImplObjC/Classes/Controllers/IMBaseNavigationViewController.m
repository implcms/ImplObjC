//
//  IMBaseNavigationViewController.m
//  ImplObjC
//
//  Created by GheniAblez on 2022/7/3.
//

#import "IMBaseNavigationViewController.h"

@interface IMBaseNavigationViewController ()

@end

@implementation IMBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
    self.interactivePopGestureRecognizer.delegate = nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
