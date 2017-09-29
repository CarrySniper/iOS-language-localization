//
//  WMLanguageManager.m
//  InternationalLanguage
//
//  Created by 炬盈科技 on 2017/9/26.
//  Copyright © 2017年 CJQ. All rights reserved.
//

#import "WMLanguageManager.h"

@implementation WMLanguageManager

+ (instancetype)manager {
    return [[self alloc] init];
}

static WMLanguageManager *instance = nil;
static dispatch_once_t onceToken;
- (instancetype)init
{
    dispatch_once(&onceToken, ^{
        instance = [super init];
        // MARK: 没有设置过语言，就获取当前系统语言，并设置为APP语言
        if (!self.currentLanguage) {
            if ([self.localeLanguage hasPrefix:WMLanguageOfChinese]) {//开头匹配
                self.currentLanguage = WMLanguageOfChinese;
            }else{
                self.currentLanguage = WMLanguageOfEnglish;
            }
        }
    });
    return instance;
}

#pragma mark 根据键值获取对应文字。table为语言文件名Language.strings
- (NSString *)wm_matchString:(NSString *)string {
    NSString *path = [self currentLanguagePath];
    NSString *matchString = [[NSBundle bundleWithPath:path] localizedStringForKey:string value:nil table:WMNameForLanguageFile];
    return matchString ? matchString : string;
}

#pragma mark -
#pragma mark 内部方法
/**
 保存设置当前语言到NSUserDefaults
 
 @param currentLanguage 语言名称
 */
- (void)setCurrentLanguage:(NSString *)currentLanguage {
    if ([currentLanguage isEqualToString:self.currentLanguage]) {
        return;
    }
    // 方法一：代理切换事件
    if (self.protocol && [self.protocol respondsToSelector:@selector(languageChange:)]) {
        [self.protocol languageChange:currentLanguage];
    }
    // 方法二：发出切换通知
    [[NSNotificationCenter defaultCenter] postNotificationName:WMNotificationLanguageChange object:currentLanguage];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:currentLanguage forKey:WMKeyForUDLanguage];
    [userDefaults synchronize];
}

/**
 获取当前本地语言
 
 @return 当前的语言
 */
- (NSString *)localeLanguage {
    return (NSString *)[[NSLocale preferredLanguages] objectAtIndex:0];
}

/**
 获取保存在NSUserDefaults的本地语言
 
 @return 保存的语言
 */
- (NSString *)currentLanguage {
    return [[NSUserDefaults standardUserDefaults] objectForKey:WMKeyForUDLanguage];
}

/**
 根据获取语言文件所在路径。文件名类型Type为lproj，即.lproj的文件夹。  zh-Hans.lproj和en.lproj
 
 @return 文件路径
 */
- (NSString *)currentLanguagePath {
    return (NSString *)[[NSBundle mainBundle] pathForResource:[self currentLanguage] ofType:@"lproj"];
}

#pragma mark -
#pragma mark 添加语言切换通知
+ (void)addNotificationCenter:(id)observer selector:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:WMNotificationLanguageChange object:nil];
}

#pragma mark 移除语言切换通知
+ (void)removeNotificationCenter:(id)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:WMNotificationLanguageChange object:nil];
}

@end
