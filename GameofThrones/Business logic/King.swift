//
//  King.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

class King {
    private(set) var name: String!
    static private(set) var numberOfAttacks: Int = 0
    static private(set) var numberOfDefends: Int = 0
    static private(set) var numberOfVictory: Int = 0
    private(set) var outcome: String!
    var rank: Int = 0
    var initialRank = 400
    
    init(battle: GOTBattle, name: String) {
        self.name =  name
        King.numberOfAttacks = battle.numberOfAttacks
        King.numberOfDefends = battle.numberOfDefends
        King.numberOfVictory = battle.numberOfVictory
        self.outcome = battle.outcome
        self.rank = getRank()
    }
    
    func getRank() -> Int {
        switch self.outcome {
        case "win":
            return getRank()
        case "loose":
            return getRank()
        default:
            return 0
        }
    }
    
    func getRankForWinner() -> Int {
        return 0
    }
    
    func getRankForLooser() -> Int {
        return 0
    }
}
