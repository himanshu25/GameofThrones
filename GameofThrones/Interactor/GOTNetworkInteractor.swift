//
//  GOTNetworkInteractor.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

class GOTNetworkInteractor {
    
    private func getBattlesDetail() {
        let worker = GOTNetworkWorker()
        worker.getGOTBattleDetail(with: { [weak self] (error, GOTarray) in
            if let strongSelf = self {
                guard let battleArray = GOTarray else { return }
                var battleViewModelArray = [GOTBattleCellViewModel]()
                for battel in battleArray {
                    let battleViewModel = GOTBattleCellViewModel(battle: battel)
                    battleViewModelArray.append(battleViewModel)
                }
            }
        })
    }
}

