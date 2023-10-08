//
//  Segue++.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 4.10.2023.
//

import Foundation
import UIKit

enum SegueIdentifier: String {
    case toHomeDetails, toDownloadedContent
}

protocol SeguePerformable {
    func performSegue(identifier: SegueIdentifier, sender: Any?)
}

extension SeguePerformable where Self: UIViewController {
    func performSegue(identifier: SegueIdentifier, sender: Any? = nil) {
        switch identifier {
        case .toHomeDetails:
            if let movie = sender as? MovieResults {
                performSegue(withIdentifier: identifier.rawValue, sender: movie)
            }
        case .toDownloadedContent:
            performSegue(withIdentifier: identifier.rawValue, sender: sender)
        }
    }
}
