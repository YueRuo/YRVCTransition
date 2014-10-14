//
//  UIViewController+YRVCTransition.h
//  YRVCTransitionDemo
//
//  Created by 王晓宇 on 14-10-10.
//  Copyright (c) 2014年 YueRuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRVCTransition.h"
#import "YRPercentDrivenInteractiveTransition.h"


@interface UIViewController (YRVCTransition)<UIViewControllerTransitioningDelegate>

@property (retain,nonatomic) YRVCTransition *transition;//animation
@property (assign,nonatomic) YRVCTransitionSwipeDir swipeDir;//the back gesture dir
@property (assign,nonatomic) BOOL enableBackGesture;//gesture enable , default is YES

@end
