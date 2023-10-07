//
//  HomeCell.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var viewModel = HomeCollectionCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.view = self
        viewModel.awakeFromNib()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
    }
}

