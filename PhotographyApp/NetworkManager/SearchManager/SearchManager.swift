//
//  SearchManager.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 22.05.2023.
//

import Foundation


class SearchManager {
    
    static let shared = SearchManager()
    
    
    
    func getPhotoSearch(query: String, page: Int, completion: @escaping ((Search?, String? ) -> ())) {
        NetworkManager.shared.request(model: Search.self,
                                      url: SearchEndPoint.search.path + "&query=\(query)" ,
                                      complete: completion)
    }
    }
