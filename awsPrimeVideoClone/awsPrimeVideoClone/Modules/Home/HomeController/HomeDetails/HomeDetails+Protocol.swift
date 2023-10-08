//
//  HomeDetails+Protocol.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

protocol HomeDetailsInterface : AnyObject {
    func prepareTableView()
}


extension HomeDetailsController : HomeDetailsInterface {
    func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(viewModel.buttonCellNib, forCellReuseIdentifier: viewModel.buttonCellNibName)
        tableView.register(viewModel.infoCellNib, forCellReuseIdentifier: viewModel.infoCellName)
        tableView.register(viewModel.headerCellNib, forHeaderFooterViewReuseIdentifier: viewModel.headerCellNibName)
    }
}
