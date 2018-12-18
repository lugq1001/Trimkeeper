//
//  ViewController.m
//  example-objc
//
//  Created by 陆广庆 on 2018/9/19.
//  Copyright © 2018年 陆广庆. All rights reserved.
//

#import "ViewController.h"
#import <Trimkeeper/Trimkeeper.h>

@interface ViewController ()

@end

@implementation ViewController 

Trimkeeper *trimkeeper;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    trimkeeper = Trimkeeper.shared;

    [self registerSDK];
}


///注册sdk
- (void)registerSDK {
    
    [trimkeeper registerWithAppID:@"UnderArmour" appSecret:@"e5v42yzolq" completion:^(TKError *error) {
        if (error) {
            NSLog(@"注册失败: %@(%ld)", error.message, error.type);
        } else {
            NSLog(@"注册成功");
            
            trimkeeper.delegate = self;
            
            [self updateAsset];
            [self connectToPrinter];
            // **以下两个方法需要连接打印机后调用
            [self sendAsset];
            [self printTemplate];
        }
    }];
    
}


/// 连接打印机，支持ip或者域名，默认端口为9100
/// 打印、发送资源文件需要先连接打印机。
/// sdk目前不控制打印机自动重连，需要App监听状态，手动维持连接。
/// 建议在sdk注册成功后连接打印机，并保持连接
- (void)connectToPrinter {
    NSLog(@"连接打印机...");
    Printer *printer = [[Printer alloc] initWithHost:@"192.168.1.1" port:9100 mode:PrinterModelAvery9419];
    NSError *error;
    [trimkeeper connectPrinter:printer error:&error];
    if (error) {
        TKError *e = error.toTrimkeeperError;
        NSLog(@"连接打印机失败: %@(%ld)", e.message, e.type);
    }
}


/// 从网络下载打印机基础资源，如模板、图片等。
/// sdk会自动保存资源文件至磁盘。
/// 建议App每次启动后调用此方法。
- (void)updateAsset {
    [trimkeeper updateAssetsWithCompletion:^(TKError *error) {
        if (error) {
            NSLog(@"更新资源失败: %@(%ld)", error.message, error.type);
        } else {
            NSLog(@"更新资源成功");
        }
    }];
}

/// 将资源文件发送至打印机并更新。
/// 下载更新资源后、或人为因素造成资源文件丢失时，需要调用此方法将资源上传资源至打印机。
/// 建议仅在调用完updateAssets()后调用一次，频繁调用无任何意义且会影响打印效率
- (void)sendAsset {
    [trimkeeper sendAssetsToPrinterWithCompletion:^(TKError *error) {
        if (error) {
            NSLog(@"发送打印机资源失败: %@(%ld)", error.message, error.type);
        } else {
            NSLog(@"资源已发送至打印机");
        }
    }];
    
}


/// 打印模版
- (void)printTemplate {
    
    NSArray *templates = [trimkeeper listAllTemplates];
    for (TKTemplate *t in templates) {
        NSLog(@"name: %@ displayName: %@ previewUrl: %@", t.name, t.displayName, t.previewUrl);
    }
    
    TKTemplateFormat *template = [[TKTemplateFormat alloc] initWithTemplateName:@"sf_001"];
    NSError *error;
    [trimkeeper printWithTemplate:template error:&error];
    if (error) {
        TKError *e = error.toTrimkeeperError;
        NSLog(@"打印失败: %@(%ld)", e.message, e.type);
    }
}

/**
 TrimkeeperDelegate
 */
- (void)trimkeeperWithDidConnectTo:(Printer *)printer {
    NSLog(@"打印机 %@ 连接成功", printer.description);
}

- (void)trimkeeperWithDidDisconnectTo:(Printer *)printer withError:(TKError *)error {
    NSLog(@"打印机 %@ 连接失败: %@", printer.description, error.message);
}

@end
