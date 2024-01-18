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
    private let onboardVC = OnboardContainerVC()
    private let loginVC = LoginVC()
    private let dummyVC = DummyVC()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        #warning("TODO: UIScreen.main is deprecated you should look this later")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        onboardVC.delegate = self
        loginVC.delegate = self
        dummyVC.delegate = self
        window?.rootViewController = loginVC
        /// OPTIONAL

        return true
    }
}

extension AppDelegate {
    /// This method is used to set root view controller with smooth transition animation
    /// - Parameters:
    ///   - vc: Destination view controller
    ///   - animated: If you want to animate the transition default value is [true]
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
}

extension AppDelegate: LoginVCDelegate {
    func didLogin() {
        setRootViewController(onboardVC)
    }
}

extension AppDelegate: OnboardContainerVCDelegate {
    func didFinishOnboarding() {
        setRootViewController(dummyVC)
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginVC)
    }
}
