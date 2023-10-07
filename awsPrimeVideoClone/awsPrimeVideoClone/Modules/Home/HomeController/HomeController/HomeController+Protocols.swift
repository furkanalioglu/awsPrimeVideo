//
//  HomeController+Protocols.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import UIKit

protocol HomeViewInterface : AnyObject, SeguePerformable{
    func prepareTableView()
    func prepareNavigationView()
}

extension HomeController : HomeViewInterface {
    func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(viewModel.cellNib, forCellReuseIdentifier: viewModel.cellNibName)
        tableView.register(viewModel.headerNib, forCellReuseIdentifier: viewModel.headerNibName)
    }
    
    func prepareNavigationView() {
        navigationItem.title = "Home"
    }
}
