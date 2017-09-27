//
//  AppDelegate.h
//  本地化语言和切换
//
//  Created by CK_chan on 15/11/7.
//  Copyright © 2015年 CK_chan. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 *  获取当前保存在NSUserDefaults的本地语言
 */
#define currentLanguage [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]]

/*
 *  根据获取语言文件所在路径
 *  文件名类型Type为lproj，即.lproj的文件夹。  zh-Hans.lproj和en.lproj
 *  存在NSUserDefaults的适合，中英文就分别设置为zh-Hans和en，不可改变。
 */
#define LanguagePath    [[NSBundle mainBundle] pathForResource:currentLanguage ofType:@"lproj"]

/*
 *  根据键值获取返回转换结果
 */
#define Localized(key)  [[NSBundle bundleWithPath:LanguagePath] localizedStringForKey:(key) value:nil table:@"Language"]    //table为语言文件名Language.strings

//等同于上面定义的三个宏
//#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Language"]


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


/*
 *  自定义
 */
@property (strong, nonatomic) UITabBarController *tabbarCtr;

- (void)toMain;


@end

