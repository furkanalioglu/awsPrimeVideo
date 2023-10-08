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
    func heightForRow(at indexPath: IndexPath) -> CGFloat
    func heightForHeaderInSection(section: Int) -> CGFloat
}

extension HomeDetailsViewModel : HomeDetailsViewModelInterface{
    func viewDidLoad() {
        view?.prepareTableView()
        Task{
            if let fetchedId = try await YoutubeManager.shared.fetchTrailer(for: "merhaba") {
                self.youtubeId = fetchedId.id?.videoId
            }
        }
    }
    
    func heightForRow(at indexPath: IndexPath) -> CGFloat{
        switch indexPath.section{
        case 0:
            return 70
        case 1:
            return 200
        default:
            return 100
        }
    }
    
    func heightForHeaderInSection(section: Int) -> CGFloat {
        switch section{
        case 0 :
            return 200
        default:
            return 0
        }
    }
    
}
