//
//  AccountCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 15.06.2023.
//

import UIKit
import SDWebImage

class AccountCell: UICollectionViewCell {
    @IBOutlet private weak var titleImageView: UIImageView!
    
    
    func configureData(data: Photos) {
        guard let url           = data.urls?.raw else { return }
        titleImageView.loadUrl(url)
        

    }
}
