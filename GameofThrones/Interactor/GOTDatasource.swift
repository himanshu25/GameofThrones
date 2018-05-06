//
//  GOTInteractor.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import UIKit

protocol GOTBattleDataSource: class {
    func didTapCell(_viewModel: GOTBattleCellViewModel)
}

class GOTDataSource: NSObject, UITableViewDataSource {
    var battleViewModelArray = [GOTBattleCellViewModel]()
    weak var dataSource: GOTBattleDataSource?
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return battleViewModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as! GOTBattleCell
        if battleViewModelArray.count > 0 {
            let viewModel = battleViewModelArray[indexPath.row]
            cell.viewModel = viewModel
            cell.setupUI(info: viewModel)
        }
        return cell
    }
}
