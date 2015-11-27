//
//  YRVCTransitionMoveIn.m
//  Mark
//
//  Created by 王晓宇 on 14-10-10.
//  Copyright (c) 2014年 王晓宇. All rights reserved.
//

#import "YRVCTransitionMoveIn.h"

@implementation YRVCTransitionMoveIn

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromView:(UIView *)fromView toView:(UIView *)toView initialFrame:(CGRect)initialFrame finalFrame:(CGRect)finalFrame{
    UIView *containerView = [transitionContext containerView];
    fromView.frame = initialFrame;
    toView.frame = finalFrame;
    
    CGPoint fromViewCenter = fromView.center;
    CGPoint toViewCenter = toView.center;
    CGPoint parallaxCenter = self.reverse?toViewCenter:fromViewCenter;
    CGPoint startCenter = self.reverse?fromViewCenter:toViewCenter;
    
    switch (self.direction) {
        case YRVCTransitionDirection_FromTop:{
            startCenter.y = startCenter.y-containerView.frame.size.height;
            break;}
        case YRVCTransitionDirection_FromLeft:{
            startCenter.x = startCenter.x-containerView.frame.size.width;
            break;}
        case YRVCTransitionDirection_FromBottom:{
            startCenter.y = startCenter.y+containerView.frame.size.height;
            break;}
        case YRVCTransitionDirection_FromRight:{
            startCenter.x = startCenter.x+containerView.frame.size.width;
            break;}
        default:
            break;
    }
    self.parallaxRatio = fminf(1.0, fmaxf(self.parallaxRatio, 0.0));

    if (self.reverse) {
        parallaxCenter.x = (fromViewCenter.x-startCenter.x)*self.parallaxRatio+toViewCenter.x;
        parallaxCenter.y = (fromViewCenter.y-startCenter.y)*self.parallaxRatio+toViewCenter.y;
        toView.center = parallaxCenter;
        [containerView insertSubview:toView belowSubview:fromView];
    }else{
        parallaxCenter.x = (toViewCenter.x-startCenter.x)*self.parallaxRatio+fromViewCenter.x;
        parallaxCenter.y = (toViewCenter.y-startCenter.y)*self.parallaxRatio+fromViewCenter.y;
        toView.center = startCenter;
        [containerView addSubview:toView];
    }

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (self.reverse) {
            fromView.center = startCenter;
            toView.center = toViewCenter;
        }else{
            fromView.center = parallaxCenter;
            toView.center = toViewCenter;
        }
    } completion:^(BOOL finished) {
        fromView.frame = initialFrame;
        toView.frame = finalFrame;
        if ([transitionContext transitionWasCancelled]) {
            [toView removeFromSuperview];
        }else{
            [fromView removeFromSuperview];
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
