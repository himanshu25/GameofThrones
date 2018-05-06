//
//  GOTViewController+DataSource.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import UIKit

extension GOTViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as! GOTBattleCell
        let king = presenter.getKingAtIndex(index: indexPath.row)
        cell.nameLabel.text = king
        return cell
    }
}
