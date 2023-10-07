//
//  HomeCollectionCell+Protocols.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import UIKit

protocol HomeCollectionCellInterface : AnyObject{
    func prepareCollectionView()
}

extension HomeCell : HomeCollectionCellInterface {
    func prepareCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(viewModel.nib, forCellWithReuseIdentifier: viewModel.nibName)
    }
}
