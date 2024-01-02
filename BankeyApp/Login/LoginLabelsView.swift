//
//  LoginLabelsView.swift
//  BankeyApp
//
//  Created by Kaan Uzman on 2/1/24.
//

import Foundation
import UIKit

final class LoginLabelsView: UIView {
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let titleLabelText = "Welcome to Bankey"
    private let subtitleLabelText = "Your premium source for all things banking!"

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginLabelsView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = titleLabelText
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        titleLabel.numberOfLines = .zero
        titleLabel.textAlignment = .center

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = subtitleLabelText
        subtitleLabel.font = .preferredFont(forTextStyle: .title3)
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.numberOfLines = .zero
        subtitleLabel.textAlignment = .center
    }

    private func layout() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 6)
        ])
    }
}
