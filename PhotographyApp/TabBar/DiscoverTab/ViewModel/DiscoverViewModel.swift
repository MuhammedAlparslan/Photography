//
//  DiscoverViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 31.05.2023.
//

import UIKit

class DiscoverViewModel {
    
    var items = [Discover]()
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getRandomPhoto() {
        DiscoverManager.shared.getRandomPhoto { photoData, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let photoData = photoData {
                self.items = photoData.cover_photo ?? []
                self.successCallback?()
            }
        }
    }
}
