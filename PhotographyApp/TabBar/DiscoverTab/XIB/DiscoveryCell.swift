//
//  DiscoveryCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 2.06.2023.
//

import UIKit
import SDWebImage

class DiscoveryCell: UICollectionViewCell {
    
    @IBOutlet private weak var discoveryIMage: UIImageView!
    
    func configureData(data: Discover) {
        guard let url   = data.urls?.thumb else { return }
        discoveryIMage.loadUrl(url)
    }
}
