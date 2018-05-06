//
//  GOTNetworkWorker.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

class GOTNetworkWorker {
    public typealias GOTInfoCompletionBlock = (NSError?, [GOTBattle]?) -> Void
    
    func getGOTBattleDetail(with completion: @escaping GOTInfoCompletionBlock) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url: URL = URL(string: "http://starlord.hackerearth.com/gotjson")!
        let request = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let battleJson = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    let battleDictArray = battleJson as? [[String: AnyObject]]
                    var battleInfoArray = [GOTBattle]()
                    for  battleDict in battleDictArray! {
                        let battle = GOTBattle(battleInfo: battleDict)
                        battleInfoArray.append(battle)
                    }
                    completion(nil, battleInfoArray)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
}
