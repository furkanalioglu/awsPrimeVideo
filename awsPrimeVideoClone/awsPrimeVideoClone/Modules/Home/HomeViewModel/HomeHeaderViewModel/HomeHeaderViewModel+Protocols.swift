//
//  HomeHeaderViewModel+Protocols.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import Foundation
import UIKit

protocol HomeHeaderViewModelInterface: AnyObject {
    func viewDidLoad()
    func viewDidDisappear()
    func sizeForItem(at indexPath: IndexPath)
    func didScroll(collectionView: UICollectionView)
    func getCurrentPage(for collectionView: UICollectionView) -> Int
}

protocol HomeHeaderProtocol : AnyObject {
    func prepareForSegue(movie: MovieResults)
}

extension HomeHeaderViewModel : HomeHeaderViewModelInterface{
    
    func viewDidLoad() {
        view?.prepareCollectionView()
        self.startAutoScroll()
    }
    
    func viewDidDisappear() {
        self.invalidateDisplayLink()
    }
    
    func didScroll(collectionView: UICollectionView) {
        let currentPage = getCurrentPage(for: collectionView)
        view?.updateCurrentPage(currentPage)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let selectedMovie = latestMovies[indexPath.row]
        delegate?.prepareForSegue(movie: selectedMovie)
    }
    
    func sizeForItem(at indexPath: IndexPath) {
        
    }
    
    func getCurrentPage(for collectionView: UICollectionView) -> Int {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
            return visibleIndexPath.row
        }
        
        return 0
    }
}
