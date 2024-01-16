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
    let loginVC = LoginVC()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        #warning("TODO: UIScreen.main is deprecated you should look this later")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        loginVC.delegate = self
        window?.rootViewController = loginVC
        /// OPTIONAL

        return true
    }
}

extension AppDelegate: LoginVCDelegate {
    func didLogin() {
        print("Did login...")
    }
}
