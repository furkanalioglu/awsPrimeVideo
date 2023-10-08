//
//  HomeHeader.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import UIKit


class HomeHeader: UITableViewHeaderFooterView {
    
    lazy var viewModel = HomeHeaderViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func awakeFromNib() {
       super.awakeFromNib()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    override func didMoveToSuperview() {
        viewModel.viewDidDisappear()
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
