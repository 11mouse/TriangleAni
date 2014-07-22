//
//  TAViewController.m
//  TriangleAni
//
//  Created by duan on 13-6-28.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "TAViewController.h"
#import "TATriView.h"
@interface TAViewController ()
{
    TATriView *triView;
}
@end

@implementation TAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    triView=[[TATriView alloc] initWithFrame:CGRectMake(0, 20, 320, 80)];
    [self.view addSubview:triView];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(10, 120, 60, 25);
    [btn setTitle:@"显示" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showBtn_TouchupInside) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(80, 120, 60, 25);
    [btn setTitle:@"隐藏" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(hideBtn_TouchupInside) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)showBtn_TouchupInside
{
    [triView showAni];
}

-(void)hideBtn_TouchupInside
{
    [triView hideAni];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
