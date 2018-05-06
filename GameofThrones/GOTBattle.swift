//
//  GOTBattle.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

class GOTBattle {
    
    private(set) var attacker1: String!
    private(set) var attacker2: String!
    private(set) var attackerKing: String!
    private(set) var attackerOutcome: String!
    private(set) var attackerSize: Int!
    private(set) var defenderSize: Int!
    public var rank : Int!
    
    init(battleInfo: [String : AnyObject]) {
        // extension over dict
        attacker1 = battleInfo["attacker_1"] as! String
        attacker2 = battleInfo["attacker_2"] as! String
        attackerKing = battleInfo["attacker_king"] as! String
        attackerOutcome = battleInfo["attacker_outcome"] as! String
        attackerSize = getAttackerorDefenderSizeInt(battleInfo["attacker_size"] as! String)
        defenderSize = getAttackerorDefenderSizeInt(battleInfo["defender_size"] as! String)
        let calcualatedRank = GOTRankCalculator(self)
        // computed property
        rank = calcualatedRank.calculateRank(attackerOutCome: attackerOutcome)
    }
    
    private func getAttackerorDefenderSizeInt(_ attackerorDefenderSizeString: String) -> Int {
        return Int(attackerorDefenderSizeString.isEmpty ? "0": attackerorDefenderSizeString)!
    }
}
