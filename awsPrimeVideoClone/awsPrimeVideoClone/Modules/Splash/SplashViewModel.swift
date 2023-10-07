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
    
    lazy var movies = [MovieResults]()
    
    func fetchMovies() async {
        do {
            let fetchedMovies = try await NetworkManager.shared.fetchMovieList()
            movies = fetchedMovies
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

