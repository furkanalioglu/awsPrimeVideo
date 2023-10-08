//
//  HomeDetailsViewModel.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

final
class HomeDetailsViewModel {
    weak var view : HomeDetailsInterface?
    
    lazy var buttonCellNib = UINib(nibName: "HomeDetailsButtonCell", bundle: .main)
    lazy var buttonCellNibName = "HomeDetailsButtonCell"
    lazy var infoCellNib = UINib(nibName: "HomeDetailsLabelCell", bundle: .main)
    lazy var infoCellName = "HomeDetailsLabelCell"
    lazy var headerCellNib = UINib(nibName: "HomeDetailHeaderCell", bundle: .main)
    lazy var headerCellNibName = "HomeDetailHeaderCell"
    
    
}
