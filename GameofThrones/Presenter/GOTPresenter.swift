//
//  GOTPresenter.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import UIKit

class GOTPresenter: UIViewController, GOTBattleProtocol {
    func didTapCell(_viewModel: GOTBattleCellViewModel) {
        
    }
    
    @IBOutlet weak var contentTable: UITableView!
    private var battleArray = [GOTBattle]()
    public typealias GOTInfoCompletionBlock = (NSError?, [GOTBattle]?) -> Void
    var dataSource: GOTDataSource?
    let interactor = GOTDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        setupNavigationBar()
        getBattlesDetail()
    }
    
    private func setupDataSource() {
        interactor.dataSource = self
        contentTable.dataSource = interactor
    }
    
    private func setupNavigationBar() {
        self.title = "Game of Thrones | Kings"
        navigationController?.navigationBar.barTintColor = .yellow
    }
    
    private func getBattlesDetail() {
        let worker = GOTNetworkWorker()
        worker.getGOTBattleDetail(with: { [weak self] (error, GOTarray) in
            if let strongSelf = self {
                guard let battleArray = GOTarray else { return }
                strongSelf.battleArray = battleArray
                var battleViewModelArray = [GOTBattleCellViewModel]()
                for battel in battleArray {
                    let battleViewModel = GOTBattleCellViewModel(battle: battel)
                    battleViewModelArray.append(battleViewModel)
                }
                strongSelf.interactor.battleViewModelArray = battleViewModelArray
                strongSelf.showBattlesDetail()
            }
        })
    }
    
    private func showBattlesDetail() {
        DispatchQueue.main.async {
            self.contentTable.reloadData()
        }
    }
}

