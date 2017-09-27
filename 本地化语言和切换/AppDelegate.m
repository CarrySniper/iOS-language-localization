//
//  AppDelegate.m
//  本地化语言和切换
//
//  Created by CK_chan on 15/11/7.
//  Copyright © 2015年 CK_chan. All rights reserved.
//



#import "AppDelegate.h"

#import "FristViewController.h"
#import "SecondViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
        
    /*
     *  获取当前系统语言，判断首次应该使用哪个语言文件
     */
    if (![[NSUserDefaults standardUserDefaults]objectForKey:@"appLanguage"]) {
        NSArray *languages = [NSLocale preferredLanguages];
        NSString *language = [languages objectAtIndex:0];
        if ([language hasPrefix:@"zh-Hans"]) {//开头匹配
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
        }
    }
    
    //到主页
    [self toMain];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)toMain {
    self.tabbarCtr = [[UITabBarController alloc]init];
    self.window.rootViewController = self.tabbarCtr;
    
    //初始化两个试图控制器
    FristViewController *vc1 = [[FristViewController alloc]init];
    UINavigationController *navCtr1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    
    SecondViewController *vc2 = [[SecondViewController alloc]init];
    UINavigationController *navCtr2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    
    vc1.title = Localized(@"页面一");
    vc2.title = Localized(@"页面二");
    
    NSArray *array = @[navCtr1, navCtr2];
    self.tabbarCtr.viewControllers = array;
    
    //tabBar背景颜色
    self.tabbarCtr.tabBar.barTintColor = [UIColor brownColor];
    //被选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:12],                                                        NSForegroundColorAttributeName :[UIColor purpleColor]                                                        } forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:12],                                                        NSForegroundColorAttributeName :[UIColor whiteColor]                                                        } forState:UIControlStateNormal];
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
