//
//  HomeCollectionCellViewModel.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import UIKit

final
class HomeCollectionCellViewModel {
    var movies: [MovieResults] = []
    var tableViewIndex: Int = 0
    lazy var nib = UINib(nibName: "HomeCollectionCell", bundle: .main)
    lazy var nibName =  "HomeCollectionCell"
    weak var view: HomeCollectionCellInterface?

    func setup(with movies: [MovieResults], tableViewIndex: Int) {
        self.movies = movies
        self.tableViewIndex = tableViewIndex
    }
    internal
    func calculateHeight() -> CGSize {
        switch tableViewIndex{
        case 2:
            return CGSize(width: 100, height: 150)
        default:
            return CGSize(width: 150, height: 100)
        }
    }
}
