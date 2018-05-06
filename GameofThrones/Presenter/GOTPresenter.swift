//
//  GOTPresenter.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import UIKit

class GOTPresenter: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var contentTable: UITableView!
    var gotArray = [GOTBattle]()
    public typealias GOTInfoCompletionBlock = (NSError?, [GOTBattle]?) -> Void
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTable.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as! GOTBattleCell
        if gotArray.count > 0 {
            let viewModel = GOTBattleCellViewModel(battle: gotArray[indexPath.row])
            cell.viewModel = viewModel
        }
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let interactor = GOTDataSource()
        // interactor.doSomeThing()
        self.title = "Game of Thrones | Kings"
        navigationController?.navigationBar.barTintColor = UIColor.yellow
        let worker = GOTNetworkWorker()
        worker.getGotBattleDetail(with: { (error, GOTarray) in
            self.contentTable.dataSource = self
            self.contentTable.delegate = self
            self.contentTable.reloadData()
            self.gotArray = GOTarray!
        })
    }
}

