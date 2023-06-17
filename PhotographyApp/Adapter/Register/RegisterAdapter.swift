//
//  RegisterAdapter.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage


class RegisterAdapter {
    
    func registerUser(credentials: Register, completion: @escaping (String?) -> Void) {
        let email    = credentials.email
        let password = credentials.password
        let username = credentials.username
        let fullname = credentials.fullname
        
        
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName    = NSUUID().uuidString
        let storageRef  = STORAGE_PROFILE_IMAGES.child(fileName)
        
        storageRef.putData(imageData, metadata: nil) {  (meta, error) in
            storageRef.downloadURL { url, err in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        completion(error.localizedDescription)
                    }
                    
                    guard let uid = result?.user.uid else { return }
                    let values = ["email"           : email,
                                  "password"        : password,
                                  "username"        : username,
                                  "fullname"        : fullname,
                                  "profileImageUrl" : profileImageUrl]
                    
                    REF_USERS.child(uid).updateChildValues(values)
                    completion(nil)
                }
            }
        }
    }
}

