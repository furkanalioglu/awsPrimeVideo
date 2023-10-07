//
//  HomeHeader.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import UIKit

protocol HomeHeaderInterface : AnyObject{
    func prepareCollectionView()
}

class HomeHeader: UITableViewHeaderFooterView {
    
    lazy var viewModel = HomeHeaderViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeHeader: HomeHeaderInterface {
    func prepareCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(viewModel.cellNib, forCellWithReuseIdentifier: viewModel.cellNibName)
    }
}
