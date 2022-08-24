//
//  ItemCollectionViewCell.swift
//  iTunesApp
//
//  Created by Abdurrahman Karaoluk on 7.08.2022.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemKind: UILabel!
    
    func updateUI(with item: ResultModel) {
        
        if item.artworkUrl100 != nil {
            self.itemImageView.setImage(String(item.artworkUrl100!), placeholder: "noImage")
        }

        if  let kind = item.kind, kind != "" {
            itemKind.text = kind
        } else {
            itemName.text = "N/A"
        }
        
        if item.collectionName != nil {
            itemName.text = item.collectionName
        } else {
            itemName.text = "N/A"
        }
        
        self.itemImageView.layer.borderWidth = 3
        self.itemImageView.layer.borderColor = UIColor.black.cgColor
        self.itemImageView.layer.cornerRadius = 10
        
    }
    
}
