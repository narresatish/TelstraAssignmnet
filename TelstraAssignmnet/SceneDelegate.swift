//
//  SceneDelegate.swift
//  TelstraAssignmnet
//
//  Created by SATISH KUMAR on 29/06/20.
//  Copyright © 2020 self. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see 
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let homeViewController = HomeController()
        homeViewController.view.frame = UIScreen.main.bounds
               window!.rootViewController = homeViewController
        let navController:UINavigationController = UINavigationController(rootViewController: homeViewController)
        self.window?.rootViewController = navController;
        self.window?.makeKeyAndVisible()
    }

 


}

