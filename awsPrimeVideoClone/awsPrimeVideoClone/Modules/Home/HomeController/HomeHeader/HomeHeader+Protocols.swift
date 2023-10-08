//
//  HomeHeader+Protocols.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

protocol HomeHeaderInterface : AnyObject{
    func prepareCollectionView()
    func getCollectionView() -> UICollectionView
    func updateCurrentPage(_ page: Int)
}

extension HomeHeader: HomeHeaderInterface{
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
        pageControl.currentPage = 0
        pageControl.numberOfPages = viewModel.latestMovies.count
    }
    
    func getCollectionView() -> UICollectionView {
        return collectionView
    }
    
    func updateCurrentPage(_ page: Int) {
        pageControl.currentPage = page
    }
}

extension HomeController: HomeHeaderProtocol, SeguePerformable {
    func prepareForSegue(movie: MovieResults) {
        performSegue(identifier: .toHomeDetails,sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.toHomeDetails.rawValue,
           let destinationVC = segue.destination as? HomeDetailsController,
           let movie = sender as? MovieResults {
            destinationVC.viewModel.movie = movie
        }
    }
}


