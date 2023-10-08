//
//  HomeDetailsViewModel+Protocol.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import Foundation

protocol HomeDetailsViewModelInterface {
    var view : HomeDetailsInterface? { get set }
    func viewDidLoad()
}

extension HomeDetailsViewModel : HomeDetailsViewModelInterface{
    func viewDidLoad() {
        view?.prepareTableView()
    }
}
