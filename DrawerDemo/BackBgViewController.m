//
//  BackBgViewController.m
//  DrawerDemo
//
//  Created by apple on 2018/1/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BackBgViewController.h"
#import "MenusViewController.h"


@interface BackBgViewController ()
{
    CGFloat screen_width;
    CGFloat screen_height;
}
@property (nonatomic) MenusViewController *menuVc;
@property (nonatomic, assign) BOOL showing ;

@end

@implementation BackBgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"抽屉demo";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(80, 90, 200, 60);
    button.backgroundColor = [UIColor purpleColor];
    [button setTitle:@"切入/切出" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:19];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
     screen_width = CGRectGetWidth(self.view.bounds);
     screen_height = CGRectGetHeight(self.view.bounds);
    _menuVc = [[MenusViewController alloc] init];
    _menuVc.view.frame = CGRectMake(screen_width, 0, screen_width-100, screen_height);
    
    __weak typeof(self) weakself = self;
    
    _menuVc.removeSearchView = ^(id obj) {
        [weakself buttonClick];
    };
    [self addChildViewController:_menuVc];
    [self.view addSubview:_menuVc.view];
    
}

- (void)buttonClick {
    
    [UIView animateWithDuration:0.5 animations:^{
        
        
        if (_showing == NO) {
            _menuVc.view.frame = CGRectMake(0, 0, screen_width, screen_height);
        } else {
            _menuVc.view.frame = CGRectMake(screen_width, 0, screen_width, screen_height);
        }
        
    }];
    
    _showing = !_showing;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
