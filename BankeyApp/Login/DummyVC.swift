//
//  DummyVC.swift
//  BankeyApp
//
//  Created by Kaan Uzman on 17/1/24.
//

import UIKit

class DummyVC: UIViewController {
    let stackView: UIStackView = .init()
    let labelView: UILabel = .init()
    let logoutButton: UIButton = .init(type: .system)
    
    weak var delegate: LogoutDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Welcome"
        labelView.font = .preferredFont(forTextStyle: .title1)

        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .tinted()
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutButtonOnTapped), for: .primaryActionTriggered)
    }

    private func layout() {
        stackView.addArrangedSubview(labelView)
        stackView.addArrangedSubview(logoutButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func logoutButtonOnTapped() {
        // some code
        delegate?.didLogout()
    }
}
