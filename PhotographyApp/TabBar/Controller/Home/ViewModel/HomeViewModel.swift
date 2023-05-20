//
//  HomeViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import Foundation

class HomeViewModel {
    
    var items = [Photos]()
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getPhotoItems() {
        HomeManager.shared.getPhotoItems { photoData, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let photoData = photoData {
                self.items = photoData
                self.successCallback?()
            }
        }
    }
}
