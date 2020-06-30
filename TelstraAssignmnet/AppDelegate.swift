//
//  AppDelegate.swift
//  TelstraAssignmnet
//
//  Created by SATISH KUMAR on 29/06/20.
//  Copyright © 2020 self. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      
        //guard let windowScene = UIWindow(frame: UIScreen.main.bounds) else {return }
               window = UIWindow(frame: UIScreen.main.bounds)
               let homeViewController = HomeController()
               homeViewController.view.frame = UIScreen.main.bounds
                      window!.rootViewController = homeViewController
               let navController:UINavigationController = UINavigationController(rootViewController: homeViewController)
               self.window?.rootViewController = navController;
               self.window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

