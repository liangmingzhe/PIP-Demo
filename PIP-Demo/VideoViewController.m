//
//  VideoViewController.m
//  PIP-Demo
//
//  Created by 梁明哲 on 2021/5/4.
//

#import "VideoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PipPlayer.h"
@interface VideoViewController ()

@property (nonatomic ,strong)UIButton *pipBtn;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = UIColor.whiteColor;
    

    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    self.edgesForExtendedLayout = UIRectEdgeNone; //view不需要拓展到整个屏幕
}

- (void)setupUI {
    self.pipBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 100, self.view.frame.size.width * 9/16 + 100, 50, 50)];
    [self.view addSubview:self.pipBtn];
    [self.pipBtn addTarget:self action:@selector(pipHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.pipBtn setBackgroundColor:UIColor.redColor];
    [self.pipBtn setImage:[UIImage imageNamed:@"ico_wd_xz"] forState:UIControlStateNormal];
    [[PipPlayer sharedInstance] setup:_url onView:self.view];
    [self.view.layer addSublayer:[[PipPlayer sharedInstance] videoPlayPlayer]];
    
}

- (void)pipHandle {
    
    [[PipPlayer sharedInstance] startPicInPic];
    [self.navigationController popViewControllerAnimated:YES];
}


//- (void)viewDidDisappear:(BOOL)animated {
//    [_pipController stopPictureInPicture];
//}


@end
