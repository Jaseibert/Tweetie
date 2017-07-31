//
//  AppDelegate.swift
//  Tweetie
//
//  Created by Jeremy Seibert on 7/29/17.
//  Copyright © 2017 Jeremy Seibert. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: Any]?) -> Bool {
        
        FIRApp.configure()
        
        return true
    }
}








