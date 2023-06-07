//
//  WalpaperViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 5.06.2023.
//

import UIKit


class WalpaperViewModel {
    
    static let shared = WalpaperViewModel()
    
    var walpaperId: String?

    var items = [Photos]()
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getPhotoWalpaper() {
        DiscoverManager.shared.getPhotoWalpaper(id: walpaperId ?? "") { walpaper, errrorMessage in
            if let errrorMessage = errrorMessage {
                self.errorCallback?(errrorMessage)
            } else if let walpaper = walpaper {
                self.items = walpaper
                self.successCallback?()
            }
        }
    }
}
