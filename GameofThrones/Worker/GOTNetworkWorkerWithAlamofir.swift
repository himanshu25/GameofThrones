//
//  GOTNetworkWorkerWithAlamofir.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import Alamofire

//extension GOTNetworkWorker {
//
//    public typealias GOTInfoCompletionBlock = (NSError?, [GOTBattle]?) -> Void
//
//    func request(url: String, type: HTTPMethod, with completion: @escaping GOTInfoCompletionBlock) {
//        Alamofire.request(url, method: type).responseJSON { response in
//            response.result.ifSuccess {
//                DispatchQueue.main.async {
//                    do {
//                        let responseResult = response.result
//                        let resultsDictionary = responseResult.value as? [String: AnyObject]
////                        guard let _ = resultsDictionary as? [[String: AnyObject]]
////                        let battleArray = [GOTBattle]()
////                        for  battleDict in resultsDictionary! {
////                            let battle = GOTBattle(battleInfo: battleDict)
////                            battleArray.append(battle)
//                        }
//                        completion(nil, battleArray)
//                    } catch let error as NSError {
//                        completion(error as NSError?, nil)
//                    }
//                }
//            }
//            response.result.ifFailure {
//                DispatchQueue.main.async {
//                    let code = response.response?.statusCode ?? 0
//                    completion(nil, nil)
//                }
//            }
//        }
//    }
//}
