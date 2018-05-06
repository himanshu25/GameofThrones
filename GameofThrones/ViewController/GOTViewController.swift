//
//  GOTViewController.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import UIKit

class GOTViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GOTBattlePresenterDeleagte {
    
    @IBOutlet weak var contentTable: UITableView!
    public typealias GOTInfoCompletionBlock = (NSError?, [GOTBattle]?) -> Void
    let presenter = GOTBattlePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSourceAndDelegate()
        setupNavigationBar()
        presenter.setupView()
    }
    
    private func setupDataSourceAndDelegate() {
        contentTable.dataSource = self
        contentTable.delegate = self
        presenter.delegate = self
    }
    
    private func setupNavigationBar() {
        self.title = "Game of Thrones | Kings"
        navigationController?.navigationBar.barTintColor = .yellow
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCount()
    }
    
    func reloadList() {
        DispatchQueue.main.async {
            self.contentTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as! GOTBattleCell
        let king = presenter.getKingAtIndex(index: indexPath.row)
        cell.nameLabel.text = king
        return cell
    }
    
    private func showBattlesDetail() {
        DispatchQueue.main.async {
            self.contentTable.reloadData()
        }
    }
}

