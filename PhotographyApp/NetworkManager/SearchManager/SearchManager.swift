//
//  SearchManager.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 22.05.2023.
//

import Foundation


class SearchManager {
    
    static let shared = SearchManager()
    
    func getPhotoSearch(query: String, completion: @escaping ((Photos?, String? ) -> ())) {
        NetworkManager.shared.request(model: Photos.self,
                                      url: SearchEndPoint.search.path + "&query=\(query)",
                                      complete: completion)
    }
}
