//
//  ViewController.m
//  JPLayoutDemo
//
//  Created by JUMPING on 2017/6/23.
//  Copyright © 2017年 JUMPING. All rights reserved.
//

#import "ViewController.h"
#import "JPLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [JPLayout makeView:self.view];
    [JPLayout makeFont:self.view];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
