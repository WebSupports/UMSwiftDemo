//
//  AppDelegate.swift
//  DemoUMSwift
//
//  Created by tt on 2021/12/6.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UMRemoteConfigDelegate  {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        // MD 1 第一种方式实现
        UMCommonLogManager.setUp()
        UMConfigure.setLogEnabled(true)
        UMConfigure.initWithAppkey("61adab19e0f9bb492b7fca78", channel: "App Store")
        let remoteConfig = UMRemoteConfig.init()
        remoteConfig.remoteConfigDelegate = self
        remoteConfig.configSettings.activateAfterFetch = true
        UMRemoteConfig.setDefaultsFromPlistFileName("DefaultConfig")
        
        // MD 2 第二种方式实现
        //        let liveManager = UMAliveLoadManager.init()
        //        liveManager.loadUM()
        return true
    }
    
    // MARK: - UMRemoteConfigDelegate
    func remoteConfigActivated(_ status: UMRemoteConfigActiveStatus, error: Error?, userInfo: Any?) {
        
    }
    
    func remoteConfigReady(_ status: UMRemoteConfigActiveStatus, error: Error?, userInfo: Any?) {
        UMRemoteConfig.activate { error in
            if error != nil {
                //                LLog(error)
            }
        }
    }
    
    
}

