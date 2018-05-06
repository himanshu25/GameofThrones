//
//  GOTBattle.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

class GOTBattle {
    
    public private(set) var attackerKingName: String!
    private(set) var defenderKingName: String!
    private(set) var attackerOutcome: String!
    private(set) var numberOfAttacks: Int = 0
    private(set) var numberOfDefends: Int = 0
    private(set) var numberOfVictory: Int = 0
    public var outcome: String!
    public var rank : Int!
    public var attackerKing: King!
    public var defenderKing: King!
    public var kingNames = Set<String>()
    public static var currentDefendingKingsArray = [King]()
    public static var currentAttackingKingsArray = [King]()
    public var currentAttackKing: King!
    public var currentDefenderKing: King!

    
    init(battleInfo: [String : AnyObject]) {
        attackerKingName = battleInfo["attacker_king"] as! String
        defenderKingName = battleInfo["defender_king"] as! String
        attackerOutcome = battleInfo["attacker_outcome"] as! String
        if !attackerKingName.isEmpty {
            currentAttackKing = King(battle: self, name: attackerKingName)
            GOTBattle.currentAttackingKingsArray.append(currentAttackKing)
            kingNames.insert(attackerKingName)
        }
        
        if !defenderKingName.isEmpty {
            currentDefenderKing = King(battle: self, name: defenderKingName)
            GOTBattle.currentDefendingKingsArray.append(currentDefenderKing)
            kingNames.insert(defenderKingName)
        }
        
        let calcualatedRank = GOTRankCalculator(self)
        rank = calcualatedRank.calculateRank(attackerOutCome: attackerOutcome)
    }
    
    private func getAttackerorDefenderSizeInt(_ attackerorDefenderSizeString: String) -> Int {
        return Int(attackerorDefenderSizeString.isEmpty ? "0": attackerorDefenderSizeString)!
    }
}
