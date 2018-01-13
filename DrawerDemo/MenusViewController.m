//
//  MenusViewController.m
//  DrawerDemo
//
//  Created by apple on 2018/1/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MenusViewController.h"

@interface MenusViewController ()
@property (nonatomic) NSMutableArray *buttonArr;
@end

@implementation MenusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    _buttonArr = [NSMutableArray arrayWithCapacity:2];
    
    
    
    [self bottomButtons];
}

- (void)bottomButtons {
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width ;
    CGFloat shadowW = 100.0;
    CGFloat h = CGRectGetHeight(self.view.bounds);
    
    UIView *shadow = [[UIView alloc] initWithFrame:CGRectMake(0, 0, shadowW, h)];
    shadow.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:shadow];
    UIView *shadow_content = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(shadow.frame), 0, screenWidth-shadowW, h)];
    shadow_content.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:shadow_content];

    CGFloat btnW =  (screenWidth-shadowW) / 2.0-0.5;
    CGFloat btnH = 50.0;
    CGFloat btnX = CGRectGetMaxX(shadow.frame);
    CGFloat btnY = CGRectGetMaxY(self.view.frame)-btnH;
    NSArray *arr = @[@"重置",@"确定"];
    for (int i=0; i<2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        button.backgroundColor = [UIColor lightGrayColor];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
//        [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(submitEvent:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(btnX + (0.5 + btnW)*i, btnY, btnW, btnH);
        button.tag = 100 + i;
        if (i == 0) {
//            button
        } else {
            
        }
        [self.view addSubview:button];
        
        [_buttonArr addObject:button];
        
    }
}

- (void)submitEvent:(UIButton *)button {
    
    if (button.tag == 101) {
        if (_removeSearchView) {
            _removeSearchView(@"111");
        }
    }
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
