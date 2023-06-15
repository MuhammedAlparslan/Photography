//
//  AccountViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 14.06.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class AccountViewModel {
    
    var item: ProfileUser?
    var data = [Photos]()
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    
    func fetchUser() {
        let uid = UserDefaults.standard.string(forKey: "userUid") ?? ""
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot  in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            self.item = ProfileUser(uid: uid, dictionary: dictionary)
            self.successCallback?()
        }
    }
    
    func getPhotoItems() {
        HomeManager.shared.getPhotoItems { photoData, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let photoData = photoData {
                self.data = photoData
                self.successCallback?()
            }
        }
    }
}

