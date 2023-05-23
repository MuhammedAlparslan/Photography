//
//  HomeCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import UIKit
import SDWebImage



class HomeCell: UICollectionViewCell {
    @IBOutlet private weak var imageURL: UIImageView!
    @IBOutlet private weak var nameLabel        : UILabel!
    @IBOutlet private weak var descriptionLabel : UILabel!
    @IBOutlet private weak var likeItem: UILabel!
    
    func configureData(data: Photos) {
        guard let url = data.urls?.thumb else { return }
        nameLabel.text = data.user?.instagram_username
        descriptionLabel.text = data.alt_description
        likeItem.text = "and \(data.likes ?? 0) person liked "
        imageURL.loadUrl(url)
    }
}

 
