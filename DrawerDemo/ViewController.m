//
//  ViewController.m
//  DrawerDemo
//
//  Created by apple on 2018/1/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "BackBgViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[BackBgViewController alloc] init]];
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    window.rootViewController = nav;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
