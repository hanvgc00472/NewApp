//
//  AppDelegate.swift
//  NewDevelopmentApp
//
//  Created by Nguyễn Việt Hà on 4/20/20.
//  Copyright © 2020 Nguyễn Việt Hà. All rights reserved.
//

import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        MSAppCenter.start("1cb21983-1bbe-4d23-93d5-4e528e0f1c49", withServices:[
          MSAnalytics.self,
          MSCrashes.self
        ])
        return true
    }

   
}

