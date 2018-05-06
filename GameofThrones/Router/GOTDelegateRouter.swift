//
//  GOTDelegate.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import UIKit

protocol GOTBattleDelegate: class {
    func didTapCell(_viewModel: GOTBattleCellViewModel)
}

class GOTDelegateRouter: NSObject, UITableViewDelegate {
    weak var delegate: GOTBattleDelegate?
    var viewModel: GOTBattleCellViewModel!

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // show detail vc
        
    }
}
