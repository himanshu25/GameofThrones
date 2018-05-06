//
//  GOTNetworkInteractor.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

class GOTNetworkInteractor {
    
    func getBattlesDetail() {
        let worker = GOTNetworkWorker()
        worker.getGOTBattleDetail(with: {(error, GOTarray) in
            guard let battleArray = GOTarray else { return }
            var battleViewModelArray = [GOTBattleCellModel]()
            for battel in battleArray {
                let battleViewModel = GOTBattleCellModel(battle: battel)
                battleViewModelArray.append(battleViewModel)
            }
        })
    }
}

