//
//  RegisterViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 7.06.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
 
struct Register {
    let email: String
    let password: String
    let username: String
    let profileImage: UIImage
}


struct RegisterViewModel {
    
    static let shared = RegisterViewModel()
    
    func registerUser(credentials: Register, completion: @escaping(Error?, DatabaseReference) -> Void) {
        let email = credentials.email
        let password = credentials.password
        let username = credentials.username
        
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(fileName)
        
        storageRef.putData(imageData, metadata: nil) {  (meta, error) in
            storageRef.downloadURL { (url, error ) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        return
                    }
                    
                    guard let uid = result?.user.uid else { return }
                    let values = ["email": email,
                                  "password": password,
                                  "username": username,
                                  "profileImageUrl": profileImageUrl]
                    
                    REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                }
            }
        }
    }
}
