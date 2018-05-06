//
//  GOTCellViewModel.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

class GOTBattleCellViewModel {
    var attackerKing: String!
    var rank: Int!
    var x: String!
    private var y: String!
    private var z: String!
    
    init(battle: GOTBattle) {
        self.attackerKing = battle.attackerKing
        self.rank = battle.rank
    }
}
