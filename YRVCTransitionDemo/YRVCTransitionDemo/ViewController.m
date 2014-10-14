//
//  ViewController.m
//  YRVCTransitionDemo
//
//  Created by 王晓宇 on 14-10-11.
//  Copyright (c) 2014年 YueRuo. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+YRVCTransition.h"
#import "YRVCTransitionCube.h"
#import "YRVCTransitionMoveIn.h"
#import "UINavigationController+YRVCTransition.h"

static int i;
@interface ViewController (){
    YRVCTransitionCube *cube;
    
    UIButton *buttonEnableGesture;
}

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        cube=[[YRVCTransitionCube alloc]init];
        self.transition=cube;
        
        self.swipeDir=i%4;
        i++;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.view.backgroundColor=[UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
    
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, 90, 100, 40)];
    button.backgroundColor=[UIColor brownColor];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    if (i==1) {
        return;
    }

    
    UILabel *dirTipsLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, 300, 30)];
    switch (self.swipeDir) {
        case YRVCTransitionSwipeDir_Left2Right:
            [dirTipsLabel setText:@"该页面使用左到右滑手势返回"];
            break;
        case YRVCTransitionSwipeDir_Right2Left:
            [dirTipsLabel setText:@"该页面使用右到左滑手势返回"];
            break;
        case YRVCTransitionSwipeDir_Top2Bottom:
            [dirTipsLabel setText:@"该页面使用上到下滑手势返回"];
            break;
        case YRVCTransitionSwipeDir_Bottom2Top:
            [dirTipsLabel setText:@"该页面使用下到上滑手势返回"];
            break;
        default:
            break;
    }
    [self.view addSubview:dirTipsLabel];
    
    
    buttonEnableGesture=[[UIButton alloc]initWithFrame:CGRectMake(20, 190, 180, 40)];
    buttonEnableGesture.backgroundColor=[UIColor brownColor];
    [buttonEnableGesture setTitle:@"BackGestureEnabled" forState:UIControlStateNormal];
    [buttonEnableGesture addTarget:self action:@selector(buttonEnableGesture) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonEnableGesture];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"-->>>se dir=%d",self.swipeDir);
}


-(void)pushAction{
    ViewController *vc=[[ViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:true];
    return;
    //或者你可以使用下面这种方式
    YRVCTransitionMoveIn *moveIn = [YRVCTransitionMoveIn new];
    moveIn.parallaxRatio = 0.2;
    moveIn.direction = YRVCTransitionDirection_FromTop;
    [self.navigationController pushViewController:vc withYRVCTransition:moveIn];
}
-(void)buttonEnableGesture{
    self.enableBackGesture=!self.enableBackGesture;
    NSLog(@"-->>enable==%d",self.enableBackGesture);
    [buttonEnableGesture setTitle:self.enableBackGesture?@"BackGestureEnabled":@"BackGestureDisabled" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
