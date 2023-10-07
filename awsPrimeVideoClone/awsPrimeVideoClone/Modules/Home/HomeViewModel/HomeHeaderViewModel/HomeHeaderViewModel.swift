//
//  HomeHeaderViewModel.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

protocol HomeHeaderViewModelInterface: AnyObject {
    func viewDidLoad()
    func didScroll(collectionView: UICollectionView)
    func getCurrentPage(for collectionView: UICollectionView) -> Int
    var numberOfItems: Int { get }
}

final
class HomeHeaderViewModel {
    weak var view : HomeHeaderInterface?
    lazy var latestMovies = [MovieResults]()

    lazy var cellNib = UINib(nibName: "HeaderCollectionCell", bundle: .main)
    lazy var cellNibName = "HeaderCollectionCell"
    
    var numberOfItems: Int {
        return latestMovies.count
    }
    
}

extension HomeHeaderViewModel : HomeHeaderViewModelInterface{
    func viewDidLoad() {
        view?.prepareCollectionView()
    }
    
    func didScroll(collectionView: UICollectionView) {
        let currentPage = getCurrentPage(for: collectionView)
        view?.updateCurrentPage(currentPage)
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
