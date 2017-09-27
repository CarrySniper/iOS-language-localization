//
//  LanguageConfig.h
//  InternationalLanguage
//
//  Created by 炬盈科技 on 2017/9/26.
//  Copyright © 2017年 CJQ. All rights reserved.
//

#ifndef LanguageConfig_h
#define LanguageConfig_h
#import <Foundation/Foundation.h>

//#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Language"]


//static NSString *const kLanguageOfChinese = @"zh-Hans";     // 简体中文
//static NSString *const kLanguageOfEnglish = @"en";          // 英文
//
//
///** NSUserDefaults键字符串 */
//static NSString *const kUserDefaultsForLanguage = @"appLanguage";
///** 语言文件名 */
//static NSString *const kNameOfLanguageFile = @"WMLanguage.strings";
//
///**
// 获取保存在NSUserDefaults的本地语言
//
// @return 保存的语言
// */
//#define CURRENT_LANGUAGE    [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsForLanguage]]
//
///**
// 获取当前本地语言
//
// @return 当前的语言
// */
//#define LOCALE_LANGUAGE     [[NSLocale preferredLanguages] objectAtIndex:0]
//
///**
// 根据获取语言文件所在路径。文件名类型Type为lproj，即.lproj的文件夹。  zh-Hans.lproj和en.lproj
//
// @return 文件路径
// */
//#define LANGUAGE_PATH       [[NSBundle mainBundle] pathForResource:CURRENT_LANGUAGE ofType:@"lproj"]
//
///**
// 保存设置当前语言到NSUserDefaults
//
// @param language 语言名称
// */
//#define WMSaveLanguage(language)  [[NSUserDefaults standardUserDefaults] setObject:language forKey:kUserDefaultsForLanguage]
//
///**
// 根据键值获取对应文字。table为语言文件名Language.strings
//
// @param key 键
// @return 对应语言的值
// */
//#define WMString(key)       [[NSBundle bundleWithPath:LANGUAGE_PATH] localizedStringForKey:(key) value:nil table:kNameOfLanguageFile]

#endif /* LanguageConfig_h */
