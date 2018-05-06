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
    
    init(battle: GOTBattle) {
        self.attackerKing = battle.attackerKingName
        self.rank = battle.rank
        self.kingsArray = battle.kingsArray
    }
}
