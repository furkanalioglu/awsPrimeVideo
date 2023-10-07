//
//  HomeViewModel.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import Foundation
import UIKit

final
class HomeViewModel {
    var movies : [MovieCategory: [MovieResults]]?
    var titles : [String] = ["Subtitled",
                                  "Turkhis",
                                  "Amazon Original",
                                  "Recommended"]
    
    lazy var cellNib = UINib(nibName: "HomeCell", bundle: .main)
    lazy var cellNibName = "HomeCell"
    lazy var headerNib = UINib(nibName: "HomeHeader", bundle: .main)
    lazy var headerNibName = "HomeHeader"
    
    weak var view : HomeViewInterface?

    internal
    func calculateHeight(indexPath: IndexPath) -> CGFloat {
        let category = MovieCategory.allCases[indexPath.row]
        switch category{
        case .topSeries:
            return 225
        default:
            return 150
        }
    }
}

