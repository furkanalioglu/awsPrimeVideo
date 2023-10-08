//
//  HomeDetailsLabelCell.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

class HomeDetailsLabelCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    var movie: MovieResults?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell() {
        guard let movie = movie else { return }
        descriptionLabel.text = movie.overview
        type.text = movie.title
        ratingLabel.text = "\(movie.voteAverage ?? 0.0)"
    }
    
}
