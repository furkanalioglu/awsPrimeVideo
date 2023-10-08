//
//  HomeDetailsHeader.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

class HomeDetailsHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var homeDetailsHeader: UIImageView!
    
    override class func awakeFromNib() {
    }
    
    func configure(posterPath: URL?) {
        guard let posterPath = posterPath else { return }
        homeDetailsHeader.downloaded(from: posterPath)
        homeDetailsHeader.contentMode = .scaleAspectFill
    }

}
