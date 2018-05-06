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
    public private(set) var attackerKing: String!
    private(set) var defenderKing: String!
    private(set) var attackerOutcome: String!
    private(set) var attackerSize: Int!
    private(set) var defenderSize: Int!
    private(set) var numberOfAttacks: Int = 0
    private(set) var numberOfDefends: Int = 0
    private(set) var numberOfVictory: Int = 0
    public var outcome: String!
    public var rank : Int!
    public var currentKing: King!
    public var kingsArray = [King]()
    
    init(battleInfo: [String : AnyObject]) {
        attacker1 = battleInfo["attacker_1"] as! String
        attacker2 = battleInfo["attacker_2"] as! String
        attackerKing = battleInfo["attacker_king"] as! String
        attackerOutcome = battleInfo["attacker_outcome"] as! String
        attackerSize = getAttackerorDefenderSizeInt(battleInfo["attacker_size"] as! String)
        defenderSize = getAttackerorDefenderSizeInt(battleInfo["defender_size"] as! String)
        currentKing = King(battle: self)
        kingsArray.append(currentKing)
        let calcualatedRank = GOTRankCalculator(self)
        rank = calcualatedRank.calculateRank(attackerOutCome: attackerOutcome)
    }
    
    private func getAttackerorDefenderSizeInt(_ attackerorDefenderSizeString: String) -> Int {
        return Int(attackerorDefenderSizeString.isEmpty ? "0": attackerorDefenderSizeString)!
    }
}
