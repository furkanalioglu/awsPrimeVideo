//
//  HomeHeader.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import UIKit

protocol HomeHeaderInterface : AnyObject{
    func prepareCollectionView()
    func updateCurrentPage(_ page: Int)

}

class HomeHeader: UITableViewHeaderFooterView {
    
    lazy var viewModel = HomeHeaderViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    

    override func awakeFromNib() {
       super.awakeFromNib()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    func getCurrentPage() -> Int {
        return viewModel.getCurrentPage(for: collectionView)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        viewModel.didScroll(collectionView: collectionView)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        viewModel.didScroll(collectionView: collectionView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        viewModel.didScroll(collectionView: collectionView)
    }
    
}

extension HomeHeader: HomeHeaderInterface {
    func prepareCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             flowLayout.itemSize = CGSize(width: collectionView.bounds.width, height: 200)
             flowLayout.scrollDirection = .horizontal
             flowLayout.minimumLineSpacing = 0
         }
        collectionView.register(viewModel.cellNib, forCellWithReuseIdentifier: viewModel.cellNibName)
        
    }
    
    
    func updateCurrentPage(_ page: Int) {
        pageControl.currentPage = page
    }
}

