//
//  AccountSummaryVC.swift
//  BankeyApp
//
//  Created by Kaan Uzman on 23/1/24.
//

import UIKit

class AccountSummaryVC: UIViewController {
    private let dummyData = ["ABC", "ABD", "ABE", "BBB", "AAA", "AAC", "ABC", "ABD", "ABE", "BBB", "AAA", "AAC", "ABC", "ABD", "ABE", "BBB", "AAA", "AAC", "ABC", "ABD", "ABE", "BBB", "AAA", "AAC", "ABC", "ABD", "ABE", "BBB", "AAA", "AAC"]

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension AccountSummaryVC {
    private func setup() {
        setupTableView()
        setupTableHeaderView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)

        var size = header.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size

        tableView.tableHeaderView = header
    }
}

extension AccountSummaryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        return cell
    }
}
