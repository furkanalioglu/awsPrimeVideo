//
//  HomeHeaderViewModel.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

protocol HomeHeaderViewModelInterface : AnyObject {
    var view : HomeHeaderInterface? { get set }
    func viewDidLoad()
}

final
class HomeHeaderViewModel {
    weak var view : HomeHeaderInterface?
    lazy var latestMovies = [MovieResults]()

    lazy var cellNib = UINib(nibName: "HomeHeaderCell", bundle: .main)
    lazy var cellNibName = "HomeHeaderCell"
}

extension HomeHeaderViewModel : HomeHeaderViewModelInterface{
    func viewDidLoad() {
        view?.prepareCollectionView()
    }
}
