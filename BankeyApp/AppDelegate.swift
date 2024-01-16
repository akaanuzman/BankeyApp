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
    let onboardVC = OnboardContainerVC()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        #warning("TODO: UIScreen.main is deprecated you should look this later")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        onboardVC.delegate = self
        window?.rootViewController = onboardVC
        /// OPTIONAL

        return true
    }
}

extension AppDelegate: LoginVCDelegate {
    func didLogin() {
        print("Did login...")
    }
}

extension AppDelegate: OnboardContainerVCDelegate {
    func didFinishOnboarding() {
        print("Did finish onboarding...")
    }
}
