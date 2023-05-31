//
//  DiscoverCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 31.05.2023.
//

import UIKit
import SDWebImage

protocol DiscoverCellProtocol {
    var imageURL : String { get }
}

class DiscoverCell: UICollectionViewCell {
    @IBOutlet private weak var discoveryIMage: UIImageView!
    
    func configureData(data: DiscoverCellProtocol) {
        discoveryIMage.loadUrl(data.imageURL)
    }
}

