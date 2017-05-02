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
        
        
        
        ///AlamoFire for DataDragon
        func callApi(url : String){
            
            
            //Requesting API information
            Alamofire.request(url).responseJSON(completionHandler: {
                response in
                
                let result = response.result
                if let dict = result.value {
                    _ = Mapper<ChampionList>().map(JSON: dict as! [String : AnyObject])
                    
                }
                
            })
            
        }
        let champURL = "https://ddragon.leagueoflegends.com/cdn/\(version!)/data/en_US/champion.json"
        print(champURL)
        callApi(url: champURL)
        
    }
    
    
    
    //Mappable
    public func mapping(map: Map) {
        
    }
}
