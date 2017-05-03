//
//  ChampionCollectionViewCell.swift
//  League Champs
//
//  Created by Brendan Kirchner on 5/3/17.
//  Copyright © 2017 Jason Scott. All rights reserved.
//

import UIKit
import AsyncImageView

class ChampionCollectionViewCell: UICollectionViewCell {
    
    static let ReuseIdentifier = "ChampionCollectionViewCell.ReuseIdentifier"
    
    private let label = UILabel()
    private let imageView = AsyncImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Hello World"
        
        contentView.addSubview(label)
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -2).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: label.topAnchor, constant: 2).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -2).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        
    }
    
    func setDetail(detail: ChampionDetail) {
        label.text = detail.name
        if let image = detail.image, let imageUrl = URL(string: image) {
            imageView.imageURL = imageUrl
        } else {
            imageView.imageURL = nil
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
