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
    var viewModel: GOTBattleCellViewModel!
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // ViewModel
    public func setupUI(info: GOTBattleCellViewModel) {
        viewModel = info
        nameLabel.text = viewModel.attackerKing
        rankLabel.text = "\(viewModel.rank!)"
    }
}
