//
//  HomeCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import UIKit
import SDWebImage



class HomeCell: UICollectionViewCell {

    @IBOutlet weak var imageURL: UIImageView!
    
    func configureData(data: Photos) {
        guard let url = data.urls?.thumb else { return }
        imageURL.loadUrl(url)
    }

}

 
