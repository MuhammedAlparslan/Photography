//
//  DiscoverHelper.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 31.05.2023.
//

import UIKit

enum DiscoverEndPoint: String {
    
    case photo = "photos/random"
    
    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
