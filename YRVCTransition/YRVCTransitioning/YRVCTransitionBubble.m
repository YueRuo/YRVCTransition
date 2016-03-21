//
//  YRVCTransitionBubble.m
//
//  Created by wangxiaoyu on 16/3/18.
//  Copyright © 2016年 wangxiaoyu. All rights reserved.
//

#import "YRVCTransitionBubble.h"

@implementation YRVCTransitionBubble{
    id<UIViewControllerContextTransitioning> _transitionContext;
    UIView *_toView;
    UIView *_fromView;
}
-(id)init{
    if (self=[super init]) {
        self.bubbleRect = CGRectZero;
    }
    return self;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromView:(UIView *)fromView toView:(UIView *)toView initialFrame:(CGRect)initialFrame finalFrame:(CGRect)finalFrame{
    _transitionContext = transitionContext;
    _toView = toView;
    _fromView = fromView;
    
    UIView *containerView = [transitionContext containerView];
    
    CGRect rect = self.bubbleRect;
    if (CGRectEqualToRect(rect, CGRectZero)) {
        rect = CGRectMake(containerView.frame.size.width/2, containerView.frame.size.height/2, 10, 10);
    }
    CGFloat radiusX = MAX(rect.origin.x, finalFrame.size.width-rect.origin.x);
    CGFloat radiusY = MAX(rect.origin.y, finalFrame.size.height-rect.origin.y);
    CGFloat radius = sqrt(pow(radiusX,2)+pow(radiusY,2));
    UIBezierPath *fullPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(rect, -radius, -radius)];
    UIBezierPath *bubblePath = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    UIBezierPath *fromPath;
    UIBezierPath *toPath;
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    if (self.reverse) {
        fromPath = fullPath;
        toPath = bubblePath;
        fromView.layer.mask = maskLayer;
        [containerView insertSubview:toView belowSubview:fromView];
    }else{
        fromPath = bubblePath;
        toPath = fullPath;
        toView.layer.mask = maskLayer;
        [containerView addSubview:toView];
    }
    
    maskLayer.path = toPath.CGPath;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id)fromPath.CGPath;
    animation.toValue = (__bridge id)toPath.CGPath;
    animation.duration = [self transitionDuration:transitionContext];
    animation.delegate = self;
    animation.removedOnCompletion = true;
    [maskLayer addAnimation:animation forKey:@"bubbleAnimation"];
}

-(void)animationWillCancel{
    _fromView.layer.mask = nil;
    _toView.layer.mask = nil;
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if ([_transitionContext transitionWasCancelled]) {
        [_toView removeFromSuperview];
    }else{
        [_fromView removeFromSuperview];
    }
    [_transitionContext completeTransition:![_transitionContext transitionWasCancelled]];
}
@end
