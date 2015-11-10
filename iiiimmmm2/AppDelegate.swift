//
//  AppDelegate.swift
//  iiiimmmm2
//
//  Created by Alexandr Okhotnikov on 27.10.15.
//  Copyright © 2015 АО "БАРС Груп". All rights reserved.
//

import UIKit
import ActorSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    override init() {
        super.init()
        ActorSDK.sharedActor().createActor()
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        ActorSDK.sharedActor().applicationDidFinishLaunching(application)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        ActorSDK.sharedActor().applicationWillResignActive(application)
    }
    func applicationDidEnterBackground(application: UIApplication) {
        ActorSDK.sharedActor().applicationDidEnterBackground(application)
    }
    func applicationWillEnterForeground(application: UIApplication) {
        ActorSDK.sharedActor().applicationWillEnterForeground(application)
    }
    func applicationDidBecomeActive(application: UIApplication) {
        ActorSDK.sharedActor().applicationDidBecomeActive(application)
    }
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        ActorSDK.sharedActor().application(application, didReceiveRemoteNotification: userInfo)
    }
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        ActorSDK.sharedActor().application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler:completionHandler)
    }
    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        ActorSDK.sharedActor().application(application, performFetchWithCompletionHandler:completionHandler)
    }
    
}

