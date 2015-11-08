//
//  FristViewController.m
//  本地化语言和切换
//
//  Created by CK_chan on 15/11/8.
//  Copyright © 2015年 CK_chan. All rights reserved.
//

#import "FristViewController.h"

//等同于AppDelegate.h定义的三个宏
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Language"]    //table为语言文件名Language.strings

@interface FristViewController ()

@end

@implementation FristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:22.0f],NSFontAttributeName, nil]];
    self.view.backgroundColor = [UIColor purpleColor];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, self.view.frame.size.width-20, 30)];
    label.backgroundColor = [UIColor groupTableViewBackgroundColor];
    label.layer.cornerRadius = 5;
    label.layer.masksToBounds = YES;
    label.text = [NSString stringWithFormat:@"apple=%@ ; Language=%@",Localized(@"apple"),Localized(@"Language")];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor orangeColor];
    [self.view addSubview:label];
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
