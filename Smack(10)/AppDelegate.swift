//
//  AppDelegate.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/13/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import UIKit
import Foundation


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if ProcessInfo.processInfo.arguments.contains("deleteAllData") {
            clearUserDefaults()
            let loginManager = UserDataService()
            loginManager.logoutUser()
        }
                
        if let url = ProcessInfo.processInfo.environment["TEST_BASE_URL"] {
           BASE_URL = url
        }
        return true
    }
    
    func clearUserDefaults() {
        let appDomainOpt: String? = Bundle.main.bundleIdentifier
        guard let appDomain = appDomainOpt else { return }
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
        let folders: [Any] = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        let fm = FileManager()
        for path in folders {
            guard let path = path as? String else { continue }
            try? fm.removeItem(atPath: path)
        }
        let folders_document: [Any] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fm1 = FileManager()
        for path in folders_document {
            guard let path = path as? String else { continue }
            try? fm1.removeItem(atPath: path)
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        SocketService.instance.establishConection()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        SocketService.instance.closeConnection()
    }


}

