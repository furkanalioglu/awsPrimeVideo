//
//  HomeController+Table.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import UIKit

extension HomeController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies?.keys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellNibName, for: indexPath) as? HomeCell else { fatalError("Could not load table view cell") }
        guard let cellViewModel = viewModel.configureCell(for: indexPath) else { return UITableViewCell() }
        cell.viewModel = cellViewModel
        cell.titleLabel.text = viewModel.configureTitle(for: indexPath)
        cell.viewModel.delegate = self
        cell.backgroundColor = .clear
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.calculateHeight(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: viewModel.headerNibName) as? HomeHeader else {
            fatalError("Could not load header")
        }
        guard let movies = viewModel.movies?[.topMovies]else { return nil }
        let latestMovies = Array(movies.prefix(5))
        header.viewModel.latestMovies = latestMovies
        header.pageControl.numberOfPages = latestMovies.count
        header.viewModel.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}
