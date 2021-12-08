//
//  UMAliveLoadManager.m
//  DemoUMSwift
//
//  Created by tt on 2021/12/6.
//

#import "UMAliveLoadManager.h"

@interface UMAliveLoadManager () < UMRemoteConfigDelegate >

@end

@implementation UMAliveLoadManager

+ (instancetype)shareInstance  {
    
    static dispatch_once_t token;
    static UMAliveLoadManager * shareInstance;
    dispatch_once(&token, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (void)loadUM {
    
    // Override point for customization after application launch.
    [UMCommonLogManager setUpUMCommonLogManager];
    [UMConfigure setLogEnabled:YES];
    [UMConfigure initWithAppkey:@"61adab19e0f9bb492b7fca78" channel:@"App Store"];
    
    //初始化设置activateAfterFetch = YES 为获取数据后自动激活
    //初始化设置activateAfterFetch = NO 就需要手动激活数据[UMRemoteConfig activateWithCompletionHandler:nil];
    [UMRemoteConfig remoteConfig].remoteConfigDelegate = self;
    [UMRemoteConfig remoteConfig].configSettings.activateAfterFetch = YES;
    
    //设置本地默认的数据，在没有取到服务器的数据的时候，获取本地的数据
    //    [UMRemoteConfig setDefaultsFromPlistFileName:@"RemoteConfigDefaults"];
    
    //获取的是上一次激活的数据，如果上一次的数据是最新的就直接使用，
    //不然需要在UMRemoteConfigDelegate:remoteConfigActivated的回调里面获取最新值，后续的获取都是最新的值
    NSString* configtestValue =  [UMRemoteConfig configValueForKey:@"ad_source"];
    NSLog(@"remoteConfigActivated init configtest = %@",configtestValue);
    
}

#pragma mark- UMRemoteConfigDelegate

- (void)remoteConfigActivated:(UMRemoteConfigActiveStatus)status
                       error:(nullable NSError*)error
                    userInfo:(nullable id)userInfo{
    if (error) {
        NSLog(@"remoteConfigActivated error:%@",error);
        return;
    }
    
    //回调到这表示当前获取到了服务器的最新的参数
    NSString* configtestValue =  [UMRemoteConfig configValueForKey:@"configtest"];
    NSLog(@"remoteConfigActivated Activated for configtest = %@",configtestValue);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"remoteConfigActivated" object:nil];
}


-(void)remoteConfigReady:(UMRemoteConfigActiveStatus)status
                   error:(nullable NSError*)error
                userInfo:(nullable id)userInfo{
    if (error) {
        NSLog(@"remoteConfigReady error:%@",error);
        return;
    }
    
    //在[UMRemoteConfig remoteConfig].configSettings.activateAfterFetch = NO的时候调用，来选择用以前的缓存的数据还是激活当前下载的服务器最新的数据
    //[UMRemoteConfig activateWithCompletionHandler:nil];
    
}

@end
