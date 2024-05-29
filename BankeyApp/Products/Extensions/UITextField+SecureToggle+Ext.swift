//
//  UITextField+SecureToggle+Ext.swift
//  BankeyApp
//
//  Created by Kaan Uzman on 29/5/24.
//

import Foundation
import UIKit

let passwordToggleButton = UIButton(type: .custom)

extension UITextField {
    func enablePasswordToggle() {
        passwordToggleButton.setImage(UIImage(systemName: SFSymbols.eyeFill.rawValue), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: SFSymbols.eyeSlash.rawValue), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }

    @objc private func togglePasswordView() {
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
