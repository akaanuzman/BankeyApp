//
//  MainViewController.swift
//  BankeyApp
//
//  Created by Kaan Uzman on 20/1/24.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }

    private func setupViews() {
        let summaryVC = AccountSummaryVC()
        let moneyVC = MoveMoneyVC()
        let moreVC = MoreVC()

        summaryVC.setTabBarImage(imageName: SFSymbols.account.rawValue, title: "Summary")
        moneyVC.setTabBarImage(imageName: SFSymbols.moveMoney.rawValue, title: "Move Money")
        moreVC.setTabBarImage(imageName: SFSymbols.more.rawValue, title: "More")

        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)

        summaryNC.navigationBar.tintColor = appColor
        hideNavigationBarLine(summaryNC.navigationBar)
        
        let tabs = [summaryNC, moneyNC, moreNC]
        
        viewControllers = tabs
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    private func setupTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}

class AccountSummaryVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

class MoveMoneyVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

class MoreVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}
