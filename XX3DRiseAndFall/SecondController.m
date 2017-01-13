//
//  SecondController.m
//  XX3DRiseAndFall
//
//  Created by inxx on 17/1/13.
//  Copyright © 2017年 GoGoGold E-Commerce Co.Ltd. All rights reserved.
//

#import "SecondController.h"
#import "UIViewController+XX3DFallAndRise.h"

@interface SecondController ()
@end

@implementation SecondController

- (IBAction)fallWithNav:(UIButton *)sender {
    [self showWithDuration:0.5 transformType:TransformTypeM32];
}

- (IBAction)riseWithNav:(UIButton *)sender {
    [self closeWithDuration:0.5 transformType:TransformTypeM32];
}

@end
