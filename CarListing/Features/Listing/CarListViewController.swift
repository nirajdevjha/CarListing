//
//  CarListView.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 10/10/21.
//

import UIKit

class CarListViewController: UIViewController {
    var presenter: CarListPresenterProtocol?


    private lazy var closeButton: UIBarButtonItem = {
        let button: UIButton = .init(type: .custom)
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        button.setImage(UIImage(asset: .close), for: .normal)
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero).disableAutoResize()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.separatorStyle = .none
        tableView.register(CarListTableCell.self, forCellReuseIdentifier: CarListTableCell.reuseIdentifier)
        tableView.register(SeparatorTableCell.self, forCellReuseIdentifier: SeparatorTableCell.reuseIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        presenter?.viewDidLoad()
    }

    private func setupViews() {
        title = "Cars"
        navigationItem.leftBarButtonItem = closeButton
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    @objc
    private func didTapCloseButton() {
        presenter?.dismissCarListVC()
    }
}

extension CarListViewController: CarListViewProtocol {

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK:- Table view delegate / datasource
extension CarListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows(in: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = presenter?.getCellViewModel(for: indexPath.row) else {
            return UITableViewCell()
        }
        switch cellViewModel.rowType {
        case .info:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CarListTableCell.reuseIdentifier, for: indexPath) as? CarListTableCell, let cellViewModel = cellViewModel as? CarInfoCellViewModel {
                cell.configure(from: cellViewModel)
                return cell
            }
        case .separator:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SeparatorTableCell.reuseIdentifier, for: indexPath) as? SeparatorTableCell, let cellViewModel = cellViewModel as? SeparatorCellViewModel {
                cell.configure(from: cellViewModel)
                return cell
            }
        }
        return UITableViewCell()
    }
}
