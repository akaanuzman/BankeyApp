//
//  AppDelegate.swift
//  BankeyApp
//
//  Created by Kaan Uzman on 2/1/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        #warning("TODO: UIScreen.main is deprecated you should look this later")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()
        /// OPTIONAL
        window?.backgroundColor = .systemBackground

        return true
    }
}
