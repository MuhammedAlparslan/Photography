//
//  UIImageView.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadUrl(_ posterPath: String, imageParametr: String = "&w=200&h=200") {
        if let url = URL(string: posterPath + imageParametr) {
            self.sd_setImage(with: url)
        }
    }
}
