//
//  HomeHeaderViewModel.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

final
class HomeHeaderViewModel {
    weak var view : HomeHeaderInterface?
    weak var delegate: HomeHeaderProtocol?
    lazy var latestMovies = [MovieResults]()
    
    lazy var cellNib = UINib(nibName: "HeaderCollectionCell", bundle: .main)
    lazy var cellNibName = "HeaderCollectionCell"
    
    lazy var segueIdentifier = "toHomeDetils"
    
    
    private lazy var selectedIndex = 0
    
    var displayLink: CADisplayLink?
    var startTime: CFTimeInterval?
    let scrollInterval: CFTimeInterval = 2.0
    
    internal
    func startAutoScroll() {
        startTime = CACurrentMediaTime()
        displayLink = CADisplayLink(target: self, selector: #selector(handleDisplayLink))
        displayLink?.add(to: .main, forMode: .default)
    }
    
    
    @objc func handleDisplayLink(_ link: CADisplayLink) {
        if let startTime = startTime, (link.timestamp - startTime) >= scrollInterval {
            self.scrollCollectionViewToNextItem()
            self.startTime = link.timestamp
        }
    }
    
    private 
    func scrollCollectionViewToNextItem() {
        guard let collectionView = view?.getCollectionView() else { return }
        let currentPage = getCurrentPage(for: collectionView)
        let nextPage = currentPage + 1
        
        if nextPage < latestMovies.count {
            let nextIndexPath = IndexPath(item: nextPage, section: 0)
            collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
        } else {
            let firstIndexPath = IndexPath(item: 0, section: 0)
            collectionView.scrollToItem(at: firstIndexPath, at: .centeredHorizontally, animated: false)
        }
    }
    
    func invalidateDisplayLink() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
}

