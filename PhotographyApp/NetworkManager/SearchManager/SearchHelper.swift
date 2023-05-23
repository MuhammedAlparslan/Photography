//
//  SearchHelper.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 22.05.2023.
//

import Foundation

enum SearchEndPoint: String {
    case search = "/search/collections"
    
    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
    
}
