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
    func didTapCell(_viewModel: GOTBattleCellModel)
}

class GOTRouter: NSObject, UITableViewDelegate {
    weak var delegate: GOTBattleDelegate?
    var cellModel: GOTBattleCellModel!
    
    // Can use it if required
}
