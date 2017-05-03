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
    
    private var championList = ChampionList()
    
    ///API URL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView?.register(ChampionCollectionViewCell.self, forCellWithReuseIdentifier: ChampionCollectionViewCell.ReuseIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        WebService.getStuff { (championList) in
            //do something here
            self.championList = championList ?? ChampionList()
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return championList.championInfo.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChampionCollectionViewCell.ReuseIdentifier, for: indexPath) as! ChampionCollectionViewCell
        
        cell.setDetail(detail: championList.championInfo[indexPath.row])
        
        return cell
    }
    
}

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    static let CellInset: CGFloat = 4
    
    override init() {
        super.init()
        self.scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func cellSize(forBounds bounds: CGRect) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}
