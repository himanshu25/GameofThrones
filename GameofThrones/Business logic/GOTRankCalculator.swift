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
            return calculateRankForWinner(x: 100, y: 200, num: 2)
        case Result.loose.rawValue:
            return calculateRankForLooser(x: 200, y: 100, num: 1)
        default: return 0
        }
    }
    
    private func calculateRankForWinner(x: Int, y: Int, num: Int) -> Int {
        return (x + y + 2*x*y)/400
    }
    
    private func calculateRankForLooser(x: Int, y: Int, num: Int) -> Int {
        return (x - y + 2*x*y)/400
    }
    
}
