//
//  GOTBattleCell.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import UIKit

class GOTBattleCell: UITableViewCell {
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    var gotInfo: GOTBattle!
    
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // setupUI(info: gotInfo)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // setupUI(info: gotInfo)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // ViewModel
    public func setupUI(info: GOTBattle) {
        gotInfo = info
        nameLabel.text = gotInfo.attackerKing
        rankLabel.text = "\(gotInfo.rank!)"
    }
    func fhjfdfd () {
        
    }
}
