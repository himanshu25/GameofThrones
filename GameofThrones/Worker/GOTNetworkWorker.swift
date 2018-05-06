//
//  GOTNetworkWorker.swift
//  GameofThrones
//
//  Created by Himanshu on 06/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

class GOTNetworkWorker {
    var infoArray = [GOTBattle]()
    public typealias GOTInfoCompletionBlock = (NSError?, [GOTBattle]?) -> Void
    
    func getGotBattleDetail(with completion: @escaping GOTInfoCompletionBlock) {
        let config = URLSessionConfiguration.default
        var session = URLSession(configuration: config)
        let url: URL = URL(string: "http://starlord.hackerearth.com/gotjson")!
        let request = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let dict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    let dict1 = dict as? [[String: AnyObject]]
                    print(dict1!)
                    for  info in dict1! {
//                        let got = GOTBattle(battleInfo: info)
//                        self.infoArray.append(got)
                        completion(nil, self.infoArray)
                    }
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
}
