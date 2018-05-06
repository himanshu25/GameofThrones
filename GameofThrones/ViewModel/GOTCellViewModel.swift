//
//  GOTCellViewModel.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import UIKit

class GOTBattleCellViewModel {
    var attackerKing: String!
    var rank: Int!
    var attacks: String!
    private var defends: String!
    private var victoryScore: String!
    
    init(battle: GOTBattle) {
        self.attackerKing = battle.attackerKing
        self.rank = battle.rank
    }
}
