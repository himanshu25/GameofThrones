//
//  GOTRankCalculator.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

enum Result: String {
    case win = "win"
    case loose = "loose"
}

class GOTRankCalculator {
    let battle: GOTBattle!
    
    init(_ battle: GOTBattle) {
        self.battle = battle
        calculateRank(attackerOutCome: battle.attackerOutcome)
    }
    
    func calculateRank(attackerOutCome: String) -> Int {
        switch attackerOutCome {
        case Result.win.rawValue:
            return calculateRankForWinner()
        case Result.loose.rawValue:
            return calculateRankForLooser()
        default: return 0
        }
    }
    
    private func calculateRankForWinner() -> Int {
        return battle.attackerSize * battle.defenderSize
    }
    
    private func calculateRankForLooser() -> Int {
        return battle.attackerSize * battle.defenderSize
    }
    
}
