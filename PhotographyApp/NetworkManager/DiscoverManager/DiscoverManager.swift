//
//  DiscoverManager.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 31.05.2023.
//

import UIKit


class DiscoverManager {
    
    static let shared = DiscoverManager()
    
    func getRandomPhoto(completion: @escaping((Discover?, String?) -> ())) {
        NetworkManager.shared.request(model: Discover.self,
                                      url: DiscoverEndPoint.photo.path,
                                      complete: completion)
    }
}

