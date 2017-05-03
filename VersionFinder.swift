//
//  VersionFinder.swift
//  League Champs
//
//  Created by Jason Scott on 5/2/17.
//  Copyright © 2017 Jason Scott. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire


public class VersionFinder: Mappable{
    
    var version : String?
    
    init(){
        
    }
    
    required public init?(map: Map){
        version  <- map ["v"]
    }
    
    //Mappable
    public func mapping(map: Map) {
        
    }
}
