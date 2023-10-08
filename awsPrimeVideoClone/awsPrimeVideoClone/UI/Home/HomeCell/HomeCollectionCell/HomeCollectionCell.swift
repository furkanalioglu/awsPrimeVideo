//
//  MoviesCollection.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import Foundation
import UIKit

class HomeCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with movie : MovieResults?) {
        guard let movie = movie else { return}
        imageView.downloaded(from: movie.backdropURL)
        DispatchQueue.main.async { [weak self] in
            self?.imageView.contentMode = .scaleAspectFill
        }
    }
}
