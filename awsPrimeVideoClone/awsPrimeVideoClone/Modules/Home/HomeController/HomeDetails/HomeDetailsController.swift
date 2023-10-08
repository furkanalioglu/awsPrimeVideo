//
//  HomeDetails.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

class HomeDetailsController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = HomeDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
}
