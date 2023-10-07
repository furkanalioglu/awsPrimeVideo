//
//  HomeViewModel+Protocols.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import UIKit

protocol HomeViewModelInterface : AnyObject{
    var view : HomeViewInterface? { get set }
    func viewDidLoad()
    func configureCell(for indexPath: IndexPath) -> HomeCollectionCellViewModel?
    func configureTitle(for indexPath: IndexPath) -> String?
}


extension HomeViewModel : HomeViewModelInterface {
    func viewDidLoad() {
        view?.prepareTableView()
        view?.prepareNavigationView()
    }
    
    func configureCell(for indexPath: IndexPath) -> HomeCollectionCellViewModel? {
        guard let movies = movies else { return nil }
        let category = MovieCategory.allCases[indexPath.row]
        let cellViewModel = HomeCollectionCellViewModel()
        guard let categoryMovies = movies[category] else { return nil }
        cellViewModel.setup(with: categoryMovies, tableViewIndex: indexPath.row)
        cellViewModel.tableViewIndex = indexPath.row
        return cellViewModel
    }
    
    func configureTitle(for indexPath: IndexPath) -> String? {
        let category = MovieCategory.allCases[indexPath.row]
        return category.title
    }
}
