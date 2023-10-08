//
//  HomeController+Protocols.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import UIKit

protocol HomeViewInterface : AnyObject{
    func prepareTableView()
    func prepareNavigationView()
}


extension HomeController : HomeViewInterface{
    func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(viewModel.cellNib, forCellReuseIdentifier: viewModel.cellNibName)
        tableView.register(viewModel.headerNib, forHeaderFooterViewReuseIdentifier: viewModel.headerNibName)
    }
    
    func prepareNavigationView() {
        navigationItem.title = "Home"
    }
}

extension HomeController : HomeColletionCellProtocol {
    func prepareForSegueFromCell(movie: MovieResults) {
        performSegue(identifier: .toHomeDetails, sender: movie)
    }
}

