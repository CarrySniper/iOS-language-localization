//
//  SecondViewController.m
//  本地化语言和切换
//
//  Created by CK_chan on 15/11/8.
//  Copyright © 2015年 CK_chan. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

#define LanguageChanged   @"LANGUAGE_CHANGE_NOTIFICATION"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:22.0f],NSFontAttributeName, nil]];
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 120, self.view.frame.size.width-20, 30);
    btn.backgroundColor = [UIColor purpleColor];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:[NSString stringWithFormat:@"按钮： %@",Localized(@"切换显示语言")] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //添加通知中心，监听语言改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageChanged) name:LanguageChanged object:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //移除通知中心，
    [[NSNotificationCenter defaultCenter] removeObserver:self name:LanguageChanged object:nil];
}


#pragma mark - 按钮响应事件
- (void)btnClick{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:Localized(@"切换显示语言") message:nil delegate:self cancelButtonTitle:Localized(@"取消") otherButtonTitles:Localized(@"确认"),nil];
    [view show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        //修改本地获取的语言文件-交替
        NSString *language = [[NSUserDefaults standardUserDefaults]objectForKey:@"appLanguage"];
        if ([language isEqualToString: @"en"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
        }else        {
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];

        }
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        //发出通知-语言改变
        [[NSNotificationCenter defaultCenter] postNotificationName:LanguageChanged object:nil];
    }
}

#pragma mark - 接收到语言改变的通知后，调用该方法。
/*
 *  因为是要刷新所有试图，所以之前的所有试图都要重新初始化，需要重新设置window.rootViewController
 *  为了不再重复代码，就直接调用AppDelegate的toMain方法，来设rootViewController
 *  又因为要继续保留在第二个选项卡SecondViewController，所以设置当前选中为1。（0、1）从0开始。
 */
- (void)languageChanged{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate toMain];
    
    //自动跳转
    delegate.tabbarCtr.selectedIndex = 1;// = 1即位second页
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*      3rqr r #pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
