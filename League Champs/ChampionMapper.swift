//
//  ChampionMapper.swift
//  League Champs
//
//  Created by Jason Scott on 4/22/17.
//  Copyright © 2017 Jason Scott. All rights reserved.
//

import Foundation
import ObjectMapper


public class ChampionList: Mappable{
    
    public var champs : [String : AnyObject]?
    var championInfo = [ChampionDetail]()
    
    init(){
        
    }
    
    required public init?(map: Map){
        champs  <- map["data"]
        
        
        for champions in champs! {
            if let championData = Mapper<ChampionDetail>().map(JSON: champions.value as! [String : Any]) {
//                print(championData.name)
//                print(championData.image)
                championInfo.append(championData)
            }
        }
        
    }
    
    
    //Mappable
    public func mapping(map: Map) {
        
    }
}
