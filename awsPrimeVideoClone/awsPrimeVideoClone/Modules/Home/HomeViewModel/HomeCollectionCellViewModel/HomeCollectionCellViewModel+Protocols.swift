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
    func didSelectItem(at indexPath : IndexPath)
}

protocol HomeColletionCellProtocol : AnyObject{
    func prepareForSegue(movie : MovieResults)
}

extension HomeCollectionCellViewModel : HomeCollectionCellViewModelInterface {
    func awakeFromNib() {
        view?.prepareCollectionView()
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        self.delegate?.prepareForSegue(movie: selectedMovie)
    }
}
