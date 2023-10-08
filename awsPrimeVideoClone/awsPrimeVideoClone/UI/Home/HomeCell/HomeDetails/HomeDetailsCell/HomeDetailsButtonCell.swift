//
//  HomeDetailsButtonCellTableViewCell.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

protocol HomeDetailsButtonCellProtocol : AnyObject{
    func handlePlayTapped()
    func handleDownloadTapped()
    func handleShareTapped()
}

class HomeDetailsButtonCell: UITableViewCell {
    @IBOutlet weak var playButtonOutlet: UIButton!
    @IBOutlet weak var downloadButtonOutlet: UIButton!
    @IBOutlet weak var shareButtonOutlet: UIButton!
    
    weak var delegate: HomeDetailsButtonCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func playButtonAction(_ sender: Any) {
        self.delegate?.handlePlayTapped()
    }
    
    @IBAction func downloadButtonAction(_ sender: Any) {
        self.delegate?.handleDownloadTapped()
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        self.delegate?.handleShareTapped()
    }
    

}
