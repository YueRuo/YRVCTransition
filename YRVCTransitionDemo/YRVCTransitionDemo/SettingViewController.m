//
//  SettingViewController.m
//  YRVCTransitionDemo
//
//  Created by 王晓宇 on 14-10-14.
//  Copyright (c) 2014年 YueRuo. All rights reserved.
//

#import "SettingViewController.h"
#import "UIViewController+YRVCTransition.h"
#import "YRVCTransitionMoveIn.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.transitioningDelegate=self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    YRVCTransitionMoveIn *transition=[[YRVCTransitionMoveIn alloc]init];
    [transition setDuration:0.4];
    [transition setDirection:YRVCTransitionDirection_FromTop];
    return transition;
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    YRVCTransitionMoveIn *transition=[[YRVCTransitionMoveIn alloc]init];
    [transition setDuration:0.6];
    [transition setDirection:YRVCTransitionDirection_FromTop];
    [transition setReverse:true];
    return transition;
}
@end
