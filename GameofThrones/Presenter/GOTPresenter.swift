//
//  GOTPresenter.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

protocol GOTBattlePresenterDeleagte : class {
    func reloadList()
}

class GOTBattlePresenter {
    
    let interactor = GOTNetworkWorker()
    private var kingsList = Set<String>()
    weak var delegate: GOTBattlePresenterDeleagte?
    
    public func getKingsList() -> Set<String> {
        return kingsList
    }
    
    public func getKingAtIndex(index: Int) -> String {
        return Array(kingsList)[index]
    }
    
    public func getCount() -> Int {
        return kingsList.count
    }
    
    func setupView() {
        interactor.getGOTBattleDetail(with: { [weak self] (error, GOTarray) in
            guard let battlesArray = GOTarray else { return }
            if let strongSelf = self {
                for battle in battlesArray {
                    if !battle.attackerKingName.isEmpty {
                        strongSelf.kingsList.insert(battle.currentAttackKing.name)
                    }
                    if !battle.defenderKingName.isEmpty {
                        strongSelf.kingsList.insert(battle.currentDefenderKing.name)
                    }
                }
                strongSelf.delegate?.reloadList()
            }
        })
    }
}
