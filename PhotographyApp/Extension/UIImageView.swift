//
//  UIImageView.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadUrl(_ posterPath: String) {
        if let url = URL(string: posterPath) {
            self.sd_setImage(with: url)
        }
    }
}
 
