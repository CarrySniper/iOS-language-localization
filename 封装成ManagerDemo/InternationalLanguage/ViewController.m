//
//  ViewController.m
//  InternationalLanguage
//
//  Created by 炬盈科技 on 2017/9/26.
//  Copyright © 2017年 CJQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<WMLanguageManagerProtocol>

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [WMLanguageManager manager].protocol = self;
    
    [self.button setTitle:WMString(@"button") forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)languageChange:(NSString *)language {
    NSLog(@"当前语言：%@", language);
}

- (IBAction)clickAction:(id)sender {
    
    NSString *message = [NSString stringWithFormat:@"当前使用语言为：%@", [[WMLanguageManager manager] currentLanguage]];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择语言" message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:WMString(@"cancel") style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *chineseAction = [UIAlertAction actionWithTitle:@"中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[WMLanguageManager manager] setCurrentLanguage:WMLanguageOfChinese];
        
        [self.button setTitle:WMString(@"button") forState:UIControlStateNormal];
    }];
    UIAlertAction *englishAction = [UIAlertAction actionWithTitle:@"English" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[WMLanguageManager manager] setCurrentLanguage:WMLanguageOfEnglish];
        
        [self.button setTitle:WMString(@"button") forState:UIControlStateNormal];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:chineseAction];
    [alertController addAction:englishAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
