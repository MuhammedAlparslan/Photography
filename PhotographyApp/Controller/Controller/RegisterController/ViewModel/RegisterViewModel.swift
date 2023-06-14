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


struct RegisterViewModel {
    
    var items = [Register]()
    
    var succesCallback: (()->())?
    var errorCallback: ((String)->())?

    func logInUser(withEmail email: String, password: String, completion: @escaping(Error?, AuthDataResult? ) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password)

    }
    
    func registerUser(credentials: Register) {
        let email    = credentials.email
        let password = credentials.password
        let username = credentials.username
        let fullname = credentials.fullname
        
        
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName    = NSUUID().uuidString
        let storageRef  = STORAGE_PROFILE_IMAGES.child(fileName)
        
        storageRef.putData(imageData, metadata: nil) {  (meta, error) in
            storageRef.downloadURL { (url, error ) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        self.errorCallback?(error.localizedDescription)
                    }
                    
                    guard let uid = result?.user.uid else { return }
                    let values = ["email"           : email,
                                  "password"        : password,
                                  "username"        : username,
                                  "fullname"        : fullname,
                                  "profileImageUrl" : profileImageUrl]
                    
                    REF_USERS.child(uid).updateChildValues(values)
                    self.succesCallback?()
                }
            }
        }
    }
}
