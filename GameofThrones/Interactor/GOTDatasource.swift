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
    func didTapCell(_viewModel: GOTBattleCellModel)
}

class GOTDataSource: NSObject, UITableViewDataSource {
    var battleViewModelArray = [GOTBattleCellModel]()
    var kingsArray = [King]()
    var kingNames = Set<String>()
    weak var dataSource: GOTBattleDataSource?
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kingNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as! GOTBattleCell
        if kingNames.count > 0 {
            let kingName = Array(kingNames)[indexPath.row]
             // cell.kingsArray = kingsArray
            cell.nameLabel.text = kingName
            // cell.setupUI(info: viewModel)
        }
        return cell
    }
}
