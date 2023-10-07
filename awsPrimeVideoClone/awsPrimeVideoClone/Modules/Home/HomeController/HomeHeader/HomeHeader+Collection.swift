//
//  HomeHeader+Collection.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

extension HomeHeader : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellNibName, for: indexPath) as? HeaderCollectionCell  else { fatalError("Could not load cell") }
        cell.configure(movie: viewModel.latestMovies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
      }
}
