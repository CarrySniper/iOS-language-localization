//
//  WMLanguageManager.h
//  InternationalLanguage
//
//  Created by 炬盈科技 on 2017/9/26.
//  Copyright © 2017年 CJQ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WMString(key) [[WMLanguageManager manager] wm_matchString:(key)]

/** 可选择的语言 */
static NSString *const WMLanguageOfChinese = @"zh-Hans";     // 简体中文
static NSString *const WMLanguageOfEnglish = @"en";          // 英文

/** NSUserDefaults键字符串 */
static NSString *const WMKeyForUDLanguage = @"WMAppLanguage";
/** 语言文件名 */
static NSString *const WMNameForLanguageFile = @"WMLanguage";

/** 通知——语言改变 */
static NSString *const WMNotificationLanguageChange = @"WMNotificationLanguageChange";

#pragma mark - 方法一：可使用通知模式，监听语言修改
@protocol WMLanguageManagerProtocol<NSObject>

- (void)languageChange:(NSString *)language;

@end
// ==============================

#pragma mark -
@interface WMLanguageManager : NSObject

@property (nonatomic, strong, readonly) NSString *localeLanguage;

@property (nonatomic, strong) NSString *currentLanguage;

@property (nonatomic, assign) id<WMLanguageManagerProtocol> protocol;

+ (instancetype)manager;

/**
 根据键值获取对应文字。table为语言文件名Language.strings
 亦可直接使用宏定义：WMString(string)
 
 @param string 键
 @return 对应语言的值
 */
- (NSString *)wm_matchString:(NSString *)string;

#pragma mark - 方法二：可使用通知模式，监听语言修改
/**
 添加语言切换通知

 @param observer 观察者
 @param selector 选择器
 */
+ (void)addNotificationCenter:(id)observer selector:(SEL)selector;

/**
移除语言切换通知

 @param observer 观察者
 */
+ (void)removeNotificationCenter:(id)observer;

@end


/*
 
 
 方法一：
 设置代理协议及方法：<WMLanguageManagerProtocol>
 [WMLanguageManager manager].protocol = self;
 - (void)languageChange:(NSString *)language {
 NSLog(@"当前语言：%@", language);
 }
 
 
 方法二：
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 // MARK: 添加语言切换通知
 [WMLanguageManager addNotificationCenter:self selector:@selector(languageDidChange:)];
 }
 
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 
 // MARK: 移除语言切换通知
 [WMLanguageManager removeNotificationCenter:self];
 }
 
 
 #pragma mark - NSNotification
 #pragma mark 语言切换通知事件
 - (void)languageDidChange:(NSNotification *)notification
 {
 NSString *currentLanguage = notification.object;
 NSLog(@"当前语言：%@", currentLanguage);
 }
 */


