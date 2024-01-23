//
//  OnboardVC.swift
//  BankeyApp
//
//  Created by Kaan Uzman on 3/1/24.
//

import UIKit

final class OnboardVC: UIViewController {
    let imageName: UIImage
    let titleText: String
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let nextButton = UIButton(type: .system)
    private let skipButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    init(imageName: UIImage, titleText: String) {
        self.imageName = imageName
        self.titleText = titleText
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardVC {
    private func style() {
        view.backgroundColor = .systemBackground
        
        // Stack View
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        // Image View
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = imageName
        
        // Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = .zero
        titleLabel.textAlignment = .center
        titleLabel.font = .preferredFont(forTextStyle: .title3)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.text = titleText
    }
    
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        view.addSubview(stackView)
        
        
        // Stack View Constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}

#Preview {
    OnboardVC(
        imageName: .delorean,
        titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s."
    )
}
