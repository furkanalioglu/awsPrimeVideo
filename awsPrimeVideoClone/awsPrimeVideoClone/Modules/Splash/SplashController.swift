//
//  ViewController.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 4.10.2023.
//

import UIKit

protocol SplashControllerInterface : AnyObject {
    func startActivityIndicator()
    func navigateToNext()
    func updateMoviesList()
    func handleError(error: Error )
}

class SplashController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private lazy var viewModel = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        Task {
            await viewModel.viewDidLoad()
        }
    }
    
}

extension SplashController : SplashControllerInterface{
    func startActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.startAnimating()
        }
    }
    
    func navigateToNext() {
        RootManager.switchRoot(.tabBar)
    }
    
    func updateMoviesList() {
        RootManager.switchRoot(.tabBar,sender: viewModel.movies)
    }
    
    func handleError(error: Error) {
        print(error.localizedDescription)
    }
}



