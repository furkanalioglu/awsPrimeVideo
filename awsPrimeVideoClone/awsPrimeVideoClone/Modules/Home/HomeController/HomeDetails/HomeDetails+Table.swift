//
//  HomeDetails+Table.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import UIKit

extension HomeDetailsController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.buttonCellNibName) as? HomeDetailsButtonCell else { fatalError("detail cell error")}
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.infoCellName) as? HomeDetailsLabelCell else { fatalError("detail cell error")}
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 70
        case 1:
            return 200
        default:
            return 100
        }
    }
}
