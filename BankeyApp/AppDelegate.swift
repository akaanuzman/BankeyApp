//
//  AppDelegate.swift
//  BankeyApp
//
//  Created by Kaan Uzman on 2/1/24.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let onboardVC = OnboardContainerVC()
    private let loginVC = LoginVC()
    private let mainVC = MainVC()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        #warning("TODO: UIScreen.main is deprecated you should look this later")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        onboardVC.delegate = self
        loginVC.delegate = self

        let vc = mainVC
        vc.setStatusBar()

//        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor

        setRootViewController(loginVC)
        registerForNotifications()

        return true
    }

    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
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
        if LocalState.hasOnboarded {
            setRootViewController(mainVC)
            return
        }
        setRootViewController(onboardVC)
    }
}

extension AppDelegate: OnboardContainerVCDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(mainVC)
    }
}

extension AppDelegate: LogoutDelegate {
    @objc func didLogout() {
        setRootViewController(loginVC)
    }
}
