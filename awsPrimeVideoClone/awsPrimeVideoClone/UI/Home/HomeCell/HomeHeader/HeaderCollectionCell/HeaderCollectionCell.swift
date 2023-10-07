//
//  HeaderCollectionCell.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

class HeaderCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var movie : MovieResults?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(movie : MovieResults?) {
        guard let movie = movie else { return }
        imageView.downloaded(from: movie.posterURL)
    }

}
