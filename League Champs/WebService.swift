//
//  WebService.swift
//  League Champs
//
//  Created by Brendan Kirchner on 5/3/17.
//  Copyright © 2017 Jason Scott. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class WebService {
    
    private static let VersionURL = "https://global.api.riotgames.com/api/lol/static-data/NA/v1.2/realm?api_key=feec407a-94fe-4886-a8ed-3cc889a15c66"
    
    static func getStuff(_ completion: @escaping (_ championList: ChampionList?) -> ()) {
        
        Alamofire.request(VersionURL).responseJSON(completionHandler: { response in
            
            let result = response.result
            if let res = result.value as? [String : Any] {
                if let apiData = VersionFinder(JSON: res) {
                    
                    Alamofire.request("https://ddragon.leagueoflegends.com/cdn/\(apiData.version!)/data/en_US/champion.json").responseJSON(completionHandler: { response in
                        
                        let result = response.result
                        if let dict = result.value as? [String : Any] {
                            completion(ChampionList(JSON: dict))
                        }
                        
                    })
                    
                }
                
            }
        })
        
    }

}
