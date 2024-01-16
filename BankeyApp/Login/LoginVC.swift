//
//  ViewController.swift
//  BankeyApp
//
//  Created by Kaan Uzman on 2/1/24.
//

import UIKit

protocol LoginVCDelegate: AnyObject {
    func didLogin()
}

class LoginVC: UIViewController {
    private let labelsView = LoginLabelsView()
    private let loginView = LoginView()
    private let signInButton = UIButton(type: .system)
    private let errorMessageLabel = UILabel()
    private let signInButtonText = "Sign In"

    private var username: String? {
        loginView.usernameTextField.text
    }

    private var password: String? {
        loginView.passwordTextField.text
    }
    
    weak var delegate: LoginVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginVC {
    private func style() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle(signInButtonText, for: [])
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .primaryActionTriggered)

        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = .zero
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.isHidden = true
    }

    private func layout() {
        view.addSubview(labelsView)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)

        // LabelsView constraints
        // LoginView constraints
        NSLayoutConstraint.activate([
            labelsView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: labelsView.trailingAnchor, multiplier: 1),
            labelsView.bottomAnchor.constraint(equalToSystemSpacingBelow: loginView.topAnchor, multiplier: 1),
        ])

        // LoginView constraints
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),

        ])

        // Sign In Button constraints
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])

        // Error Message Label constraints
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
}

extension LoginVC {
    @objc private func signInButtonTapped() {
        login()
    }

    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username or password should never nil")
            return
        }

        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username or password cannot be blank")
            return
        }

        if username != "abc", password != "123" {
            configureView(withMessage: "Incorret username or password")
        } else {
            signInButton.configuration?.showsActivityIndicator = true
            errorMessageLabel.isHidden = true
            delegate?.didLogin()
        }
    }

    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}

//#Preview {
//    LoginVC()
//}
