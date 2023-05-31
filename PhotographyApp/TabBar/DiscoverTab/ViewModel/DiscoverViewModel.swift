//
//  DiscoverViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 31.05.2023.
//

import UIKit

class DiscoverViewModel {
    
    var items = [DiscoverUrls]()
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getRandomPhoto() {
        DiscoverManager.shared.getRandomPhoto { photoData, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
                print(errorMessage)
            } else if let photoData = photoData {
                self.items = photoData.urls ?? []
                self.successCallback?()
            }
        }
    }
}
