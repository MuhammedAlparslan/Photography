//
//  SearchCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 22.05.2023.
//

import UIKit
import SDWebImage

class SearchCell: UICollectionViewCell {

    @IBOutlet weak var titleİmage: UIImageView!
    
    func configureData(data: Photos) {
        guard let url = data.urls?.thumb else { return }
        titleİmage.loadUrl(url)
    }
}
