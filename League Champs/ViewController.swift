//
//  ViewController.swift
//  League Champs
//
//  Created by Jason Scott on 4/21/17.
//  Copyright © 2017 Jason Scott. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Kingfisher
import SVProgressHUD


class CollectionViewController: UICollectionViewController {
    
    ///API URL
    var champURL = "https://ddragon.leagueoflegends.com/cdn/6.24.1/data/en_US/champion.json"
    
    
    //    typealias JSONStandard = [String : AnyObject]
    var championsArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callApi(url: champURL)    }
    
    func callApi(url : String){
        
        //Requesting API information
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            
            let result = response.result
            if let dict = result.value {
                let champData = Mapper<ChampionList>().map(JSON: dict as! [String : AnyObject])
                
            }
            
        })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

