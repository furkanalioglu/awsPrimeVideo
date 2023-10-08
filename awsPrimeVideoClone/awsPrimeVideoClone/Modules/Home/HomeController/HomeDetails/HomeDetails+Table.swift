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
            cell.delegate = self
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.infoCellName) as? HomeDetailsLabelCell else { fatalError("detail cell error")}
            cell.movie = viewModel.movie
            cell.configureCell()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: viewModel.headerCellNibName) as? HomeDetailsHeader else {fatalError( "Could not load header")}
            header.configure(posterPath: viewModel.movie?.posterURL)
            return header
        }else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightForRow(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        viewModel.heightForHeaderInSection(section: section)
    }
}
