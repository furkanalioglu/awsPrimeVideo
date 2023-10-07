//
//  HomeCollectionCellViewModel+Protocols.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import Foundation

protocol HomeCollectionCellViewModelInterface : AnyObject{
    var view: HomeCollectionCellInterface? { get set }
    func awakeFromNib()
}

extension HomeCollectionCellViewModel : HomeCollectionCellViewModelInterface {
    func awakeFromNib() {
        view?.prepareCollectionView()
    }
}
