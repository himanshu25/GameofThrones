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
        self.attackerKing = battle.attackerKingName
        self.rank = battle.rank
        self.kingsArray = GOTBattle.currentAttackingKingsArray
        for kings in GOTBattle.currentDefendingKingsArray {
            self.kingsArray.append(kings)
        }
        for king in self.kingsArray {
            kingNames.insert(king.name)
        }
    }
}
