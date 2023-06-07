//
//  WalpaperCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 6.06.2023.
//

import UIKit
import SDWebImage

protocol WalpaperCellDelegate {
}
class WalpaperCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    func configureData(data: Photos) {
        guard let url           = data.urls?.full else { return }
        imageView.loadUrl(url)
        
     
    }
    
}
