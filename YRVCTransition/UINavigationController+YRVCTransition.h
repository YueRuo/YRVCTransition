//
//  UINavigationController+YRVCTransition.h
//  YRVCTransitionDemo
//
//  Created by 王晓宇 on 14-10-10.
//  Copyright (c) 2014年 YueRuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRVCTransition.h"
#import "YRPercentDrivenInteractiveTransition.h"

@interface UINavigationController (YRVCTransition)<UINavigationControllerDelegate>
@property (retain,nonatomic) YRPercentDrivenInteractiveTransition *interactiveYRTransition;//gesture

-(void)bindYRTransitionDelegate;//need call after init if you want the animation


-(void)pushViewController:(UIViewController *)viewController withYRVCTransition:(YRVCTransition*)transition;
-(UIViewController *)popViewControllerWithYRVCTransition:(YRVCTransition*)transition;
-(NSArray *)popToViewController:(UIViewController *)viewController withYRVCTransition:(YRVCTransition*)transition;
-(NSArray *)popToRootViewControllerWithYRVCTransition:(YRVCTransition*)transition;
@end
