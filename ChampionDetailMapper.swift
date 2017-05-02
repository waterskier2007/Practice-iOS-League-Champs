//
//  ChampionDetailMapper.swift
//  League Champs
//
//  Created by Jason Scott on 4/29/17.
//  Copyright © 2017 Jason Scott. All rights reserved.
//

import Foundation
import ObjectMapper


public class ChampionDetail: Mappable{
    
    public var name : String!
    public var image : String!
    
    
    init(){
        
    }
    
    required public init?(map: Map){
        name    <- map["name"]
        image   <- map["image.full"]

    }
    
    //Mappable
    public func mapping(map: Map) {
        
    }
}
