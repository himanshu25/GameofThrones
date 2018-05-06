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
   
    
}
