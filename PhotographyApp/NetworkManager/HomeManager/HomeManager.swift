//
//  HomeManager.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import Foundation

class HomeManager {
    
    static let shared = HomeManager()
    
    func getPhotoItems(completion: @escaping (([Photos]?, String? ) -> ())) {
        NetworkManager.shared.request(model: [Photos].self,
                                      url: HomeEndPoint.photo.path,
                                      complete: completion)
    }
}
