//
//  AppDelegate.swift
//  Park WWDC
//
//  Created by Dylan McDonald on 6/4/22.
//

import UIKit

let tourName = "Apple Park Tour: Caffè Macs"
let tourEntryLocation = "Apple Park – Entry 9"
let tourTime = "3:10 PM – 3:40 PM"
let tourDesc = """
Learn about the architecture of Apple Park’s Ring Building and its main restaurant, Caffè Macs. On this tour, you’ll go up to the third-floor balcony level inside Caffè Macs to get a close look at some of the building’s unique architectural elements, including the world’s largest retractable glass doors. You’ll also catch an incredible view of the Inner Ring.

This tour departs from outside Entry 9, is not strenuous and is mostly inside.
"""

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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

