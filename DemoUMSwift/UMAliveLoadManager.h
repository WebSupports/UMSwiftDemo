//
//  UMAliveLoadManager.h
//  DemoUMSwift
//
//  Created by tt on 2021/12/6.
//

#import <Foundation/Foundation.h>
#import <UMCommon/UMCommon.h>
#import <UMCommon/UMRemoteConfig.h>
#import <UMCommon/UMRemoteConfigSettings.h>
#import <UMCommonLog/UMCommonLogHeaders.h>

NS_ASSUME_NONNULL_BEGIN

@interface UMAliveLoadManager : NSObject

+ (instancetype)shareInstance ;


- (void)loadUM ;

@end

NS_ASSUME_NONNULL_END
