//
//  SplashViewModel.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 4.10.2023.
//

import Foundation

protocol SplashViewModelInterface : AnyObject{
    var view: SplashControllerInterface? { get set }
    func viewDidLoad() async
}

final
class SplashViewModel {
    weak var view : SplashControllerInterface?
    
    lazy var movies = [MovieCategory:[MovieResults]]()
    
    func fetchMovies() async {
        do {
            let allMovies = try await NetworkManager.shared.fetchAllMovies()
            movies = allMovies
            view?.updateMoviesList()
        } catch {
            print("Error fetching movies: \(error)")
            view?.handleError(error: error)
        }
    }
    
}

extension SplashViewModel : SplashViewModelInterface {
    func viewDidLoad() async {
        view?.startActivityIndicator()
        await fetchMovies()
    }
}

