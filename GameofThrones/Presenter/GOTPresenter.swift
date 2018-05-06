//
//  GOTPresenter.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import UIKit

class GOTPresenter: UIViewController, GOTBattleDataSource, GOTBattleDelegate {
    func didTapCell(_viewModel: GOTBattleCellModel) {
        
    }
    
    @IBOutlet weak var contentTable: UITableView!
    private var battleArray = [GOTBattle]()
    public typealias GOTInfoCompletionBlock = (NSError?, [GOTBattle]?) -> Void
    var dataSource: GOTDataSource?
    var delegate: GOTDelegateRouter?
    let interactor = GOTDataSource()
    let router = GOTDelegateRouter()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSourceAndDelegate()
        setupNavigationBar()
        getBattlesDetail()
    }
    
    private func setupDataSourceAndDelegate() {
        interactor.dataSource = self
        contentTable.dataSource = interactor
        router.delegate = self
        contentTable.delegate = router
    }
    
    private func setupNavigationBar() {
        self.title = "Game of Thrones | Kings"
        navigationController?.navigationBar.barTintColor = .yellow
    }
    
    private func getBattlesDetail() {
        let networkInteractor = GOTNetworkWorker()
        networkInteractor.getGOTBattleDetail(with: { [weak self] (error, battleArray) in
            if let strongSelf = self {
                strongSelf.battleArray = battleArray!
                var battleViewModelArray = [GOTBattleCellModel]()
                for battel in battleArray! {
                    let battleViewModel = GOTBattleCellModel(battle: battel)
                    battleViewModel.kingsArray = battel.kingsArray
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

