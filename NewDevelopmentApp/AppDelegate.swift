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
import AppCenterDistribute

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MSDistributeDelegate {

     var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        MSDistribute.setDelegate(self);
        MSDistribute.updateTrack = MSUpdateTrack.public
        MSDistribute.setEnabled(true)
        MSDistribute.checkForUpdate()
        MSAppCenter.start("1cb21983-1bbe-4d23-93d5-4e528e0f1c49", withServices:[
          MSAnalytics.self,
          MSCrashes.self,
          MSDistribute.self
        ])
        return true
    }
    func distribute(_ distribute: MSDistribute!, releaseAvailableWith details: MSReleaseDetails!) -> Bool {

      // Your code to present your UI to the user, e.g. an UIAlertController.
      let alertController = UIAlertController(title: "Update available.",
                                            message: "Do you want to update?",
                                     preferredStyle:.alert)

      alertController.addAction(UIAlertAction(title: "Update", style: .cancel) {_ in
        MSDistribute.notify(.update)
      })

      alertController.addAction(UIAlertAction(title: "Postpone", style: .default) {_ in
        MSDistribute.notify(.postpone)
      })

      // Show the alert controller.
      self.window?.rootViewController?.present(alertController, animated: true)
      return true;
    }
 
   
}

