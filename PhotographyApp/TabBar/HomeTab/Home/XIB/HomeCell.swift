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
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var textInfo: UITextView!
    @IBOutlet private weak var likeItem: UILabel!
    
    func configureData(data: Photos) {
        guard let url = data.urls?.smallS3 else { return }
        nameLabel.text = data.user?.instagramUsername
        textInfo.text = data.user?.bio
        likeItem.text = "\(data.likes ?? 0) likes "
        imageURL.loadUrl(url)
    }

}

 
