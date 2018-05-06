//
//  GOTCellViewModel.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import UIKit

class GOTBattleCellModel {
    var attackerKing: String!
    var rank: Int!
    var attacks: String!
    private var defends: String!
    private var victoryScore: String!
    var kingsArray = [King]()
    var kingNames = Set<String>()
    
    init(battle: GOTBattle) {
        self.kingNames = battle.kingNames
    }
}
