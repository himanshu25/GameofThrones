//
//  GOTNetworkWorkerWithAlamofir.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import Alamofire

extension GOTNetworkWorker {

    func request(url: String, type: HTTPMethod, with completion: @escaping GOTInfoCompletionBlock) {
        Alamofire.request(url, method: type).responseJSON { response in
            response.result.ifSuccess {
                DispatchQueue.main.async {
                    let responseResult = response.result
                    let resultsDictionary = responseResult.value as? [[String: AnyObject]]
                    var battleArray = [GOTBattle]()
                    for  battleDict in resultsDictionary! {
                        let battle = GOTBattle(battleInfo: battleDict)
                        battleArray.append(battle)
                    }
                    completion(nil, battleArray)
                }
            }
            response.result.ifFailure {
                DispatchQueue.main.async {
                    let _ = response.response?.statusCode ?? 0
                    completion(nil, nil)
                }
            }
        }
    }
}
