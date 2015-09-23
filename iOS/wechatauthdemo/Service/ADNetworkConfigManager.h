//
//  ADNetworkConfigManager.h
//  wechatauthdemo
//
//  Created by Jeason on 20/08/2015.
//  Copyright (c) 2015 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ADNetworkConfigItem;

AUTH_DEMO_EXTERN const NSString *kConnectCGIName;
AUTH_DEMO_EXTERN const NSString *kRegisterCGIName;
AUTH_DEMO_EXTERN const NSString *kLoginCGIName;
AUTH_DEMO_EXTERN const NSString *kWXLoginCGIName;
AUTH_DEMO_EXTERN const NSString *kCheckLoginCGIName;
AUTH_DEMO_EXTERN const NSString *kGetUserInfoCGIName;
AUTH_DEMO_EXTERN const NSString *kWXBindAppCGIName;
AUTH_DEMO_EXTERN const NSString *kAppBindWXCGIName;
AUTH_DEMO_EXTERN const NSString *kMakeExpiredCGIName;

@interface ADNetworkConfigManager : NSObject

/**
 *  严格单例，唯一获得实例的方法.
 *
 *  @abstract 所有的配置都只会存在内存里，这么做的主要目的是减小安全风险.
 *
 *  @return 实例对象.
 */
+ (instancetype)sharedManager;

/**
 *  注册默认的CGI配置属性.
 *
 *  @restrict 该方法需要在任何CGI发起之前调用.
 */
- (void)setup;

/**
 *  增加一个配置.
 *
 *  @param item    要增加的配置
 *  @param keyPath 该配置的ID
 */
- (void)registerConfig:(ADNetworkConfigItem *)item forKeyPath:(NSString *)keyPath;

/**
 *  删除一个配置.
 *
 *  @param keyPath 要删除的配置的ID
 */
- (void)removeConfigForKeyPath:(NSString *)keyPath;

/**
 *  根据ID获得配置.
 *
 *  @param keyPath 配置的ID
 *
 *  @return 跟配置ID对应的配置属性
 */
- (ADNetworkConfigItem *)getConfigForKeyPath:(NSString *)keyPath;

- (NSArray *)allConfigKeys;

- (void)save;

@end
