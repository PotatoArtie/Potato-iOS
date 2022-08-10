//
//  AppDelegate.swift
//  SendbirdUIKitDemoPotato
//
//  Created by Atlas on 2022/03/07.
//

import UIKit
import SendBirdUIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //The ID of the Sendbird application you created on the Sendbird Dashboard.
//        let APP_ID = "A8C9076D-CF0B-40D4-9E97-68EF27D90913"
        let APP_ID = "5F36240B-1559-4966-B0DE-679EC261E9F2"
        
        SBUMain.initialize(applicationId: APP_ID) {
            
        } completionHandler: { error in
            
        }
        
        // Case 1: USER_ID only
        let USER_ID = "user1"
        SBUGlobals.CurrentUser = SBUUser(userId: USER_ID)
    
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

