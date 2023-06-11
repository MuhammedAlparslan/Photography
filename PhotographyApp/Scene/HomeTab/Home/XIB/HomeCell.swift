//
//  HomeCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import UIKit
import SDWebImage

class HomeCell: UICollectionViewCell {
    @IBOutlet private weak var imageURL         : UIImageView!
    @IBOutlet private weak var nameLabel        : UILabel!
    @IBOutlet private weak var descriptionLabel : UILabel!
    @IBOutlet private weak var likeItem         : UILabel!
    @IBOutlet private weak var locationLabel    : UILabel!
    @IBOutlet private weak var likeChange       : UIButton!
    
    private var likePost: Bool  = true
    
    
    func configureData(data: Photos) {
        guard let url           = data.urls?.raw else { return }
        nameLabel.text          = data.user?.instagram_username
        descriptionLabel.text   = data.description
        locationLabel.text      = data.user?.location
        likeItem.text           =  "\(data.likes ?? 0) person liked "
        imageURL.loadUrl(url, imageParametr: "w=750&dpr=2")
        descriptionLabel.lineBreakMode = .byClipping

    }
    
    @IBAction func LikeButton(_ sender: Any) {
        if  likePost ==  true {
            likeChange.setImage(UIImage(named: "heart"), for: .normal)
        } else if  likePost == true {
            likeChange.setImage(UIImage(named: "Vector"), for: .normal)
            
        }
    }
}

 
