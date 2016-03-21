//
//  DemoViewController.m
//  YRVCTransitionDemo
//
//  Created by 王晓宇 on 14-10-14.
//  Copyright (c) 2014年 YueRuo. All rights reserved.
//

#import "DemoViewController.h"
#import "SettingViewController.h"
#import "UIViewController+YRVCTransition.h"
#import "UINavigationController+YRVCTransition.h"
#import "YRVCTransitionMoveIn.h"
#import "YRVCTransitionCube.h"
#import "YRVCTransitionBubble.h"

static SettingViewController *settingVC;
@interface DemoViewController (){

}
@property (weak, nonatomic) IBOutlet UISwitch *enableSwitch;
@property (weak, nonatomic) IBOutlet UILabel *dirLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *swipeDirSegment;

@end

@implementation DemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
    
    UIBarButtonItem *rightBar=[[UIBarButtonItem alloc]initWithTitle:@"Setting" style:UIBarButtonItemStylePlain target:self action:@selector(showSetting)];
    [self.navigationItem setRightBarButtonItem:rightBar];
    
    if (!settingVC) {
        settingVC=[[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
    }
    
    //手势滑动方向初始化
    [self.swipeDirSegment setSelectedSegmentIndex:1];
    self.dirLabel.text=@"从左往右划可返回";
    self.swipeDir=YRVCTransitionSwipeDir_Left2Right;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)showSetting{
    [self presentViewController:settingVC animated:true completion:nil];
    
}


- (IBAction)switchChange:(UISwitch*)sender {
    self.enableBackGesture=sender.on;
}

- (IBAction)showNext:(id)sender {
    DemoViewController *demo=[[DemoViewController alloc]initWithNibName:@"DemoViewController" bundle:nil];
    
    YRVCTransition *transition;
    switch (settingVC.animationSegment.selectedSegmentIndex) {
        case 0:
            transition=[YRVCTransitionCube new];
            break;
        case 1:
            transition=[YRVCTransitionMoveIn new];
            break;
        case 2:
            transition=[YRVCTransitionBubble new];
            break;
        default:
            break;
    }
    transition.direction=settingVC.directionSegment.selectedSegmentIndex;
    [self.navigationController pushViewController:demo withYRVCTransition:transition];
    
}
- (IBAction)swipeDirChange:(UISegmentedControl*)sender {
    self.swipeDir=sender.selectedSegmentIndex;
    switch (self.swipeDir) {
        case YRVCTransitionSwipeDir_Top2Bottom:
            self.dirLabel.text=@"从上往下划可返回";
            break;
        case YRVCTransitionSwipeDir_Left2Right:
            self.dirLabel.text=@"从左往右划可返回";
            break;
        case YRVCTransitionSwipeDir_Bottom2Top:
            self.dirLabel.text=@"从下往上划可返回";
            break;
        case YRVCTransitionSwipeDir_Right2Left:
            self.dirLabel.text=@"从右往左划可返回";
            break;
            
        default:
            break;
    }
    NSLog(@"---self.dirLabel.text=%@",self.dirLabel.text);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
