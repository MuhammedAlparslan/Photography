//
//  SearchCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 22.05.2023.
//

import UIKit
import SDWebImage

protocol SearchProtocol {
    var imageUrl  : String { get }
}

class SearchCell: UICollectionViewCell {

    @IBOutlet weak var titleİmage: UIImageView!
 
    func configureImage(data: SearchProtocol) {
        titleİmage.loadUrl(data.imageUrl)
       
    }
    
    
    
}
