//
//  GOTDetailPresenter.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import UIKit

class GOTDetailViewController: UIViewController {
    
    static func viewController() -> GOTDetailViewController {
        let mainView = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = mainView.instantiateViewController(withIdentifier: "GOTDetailVC") as! GOTDetailViewController
        return detailVC
    }
}
