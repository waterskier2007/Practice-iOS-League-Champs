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
    var versionURL = "https://global.api.riotgames.com/api/lol/static-data/NA/v1.2/realm?api_key=feec407a-94fe-4886-a8ed-3cc889a15c66"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        versionAPI(url: versionURL)
    }
    
    ///AlamoFire for Version
    func versionAPI(url : String){
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            
            let result = response.result
            if let res = result.value{
                if let apiData = Mapper<VersionFinder>().map(JSONObject: res as! [String : AnyObject]){
                    
                }
                
            }
        })
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

