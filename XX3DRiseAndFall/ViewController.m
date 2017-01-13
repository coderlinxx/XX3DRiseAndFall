//
//  ViewController.m
//  XX3DRiseAndFall
//
//  Created by inxx on 17/1/12.
//  Copyright © 2017年 GoGoGold E-Commerce Co.Ltd. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+XX3DFallAndRise.h"

@interface ViewController ()

@end
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *fallBtn = [[UIButton alloc] initWithFrame:CGRectMake(Width/2 - 30, 100, 60, 30)];
    [fallBtn setTitle:@"下沉" forState:UIControlStateNormal];
    [fallBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [fallBtn addTarget:self action:@selector(fall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fallBtn];
    
    UIButton *riseBtn = [[UIButton alloc] initWithFrame:CGRectMake(Width/2 - 30, Height - 100, 60, 30)];
    [riseBtn setTitle:@"上升" forState:UIControlStateNormal];
    [riseBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [riseBtn addTarget:self action:@selector(rise) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:riseBtn];
}

-(void)fall{
    [self showWithDuration:0.5 transformType:TransformTypeM34];
}

-(void)rise{
    [self closeWithDuration:0.5 transformType:TransformTypeM34];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
