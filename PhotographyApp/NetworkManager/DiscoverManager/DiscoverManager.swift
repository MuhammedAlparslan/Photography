//
//  DiscoverManager.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 31.05.2023.
//

import UIKit


class DiscoverManager {
    
    static let shared = DiscoverManager()
    
    func getRandomPhoto(completion: @escaping (([Topic]?, String? ) -> ())) {
        NetworkManager.shared.request(model: [Topic].self,
                                      url: DiscoverEndPoint.random.path,
                                      complete: completion)
    }
    
    func getPhotoWalpaper(id: String, completion: @escaping (([Photos]?, String?) -> ())) {
        NetworkManager.shared.request(model: [Photos].self,
                                      url: NetworkHelper.shared.urlConfiqure(path: "topics/\(id)/photos"),
                                      complete: completion)
    }
}

