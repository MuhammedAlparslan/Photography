//
//  LoginViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 20.05.2023.
//


import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class LoginViewModel {
    let adapter = LoginAdapter()
            
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    public func signIn(with userRequest: LoginUserRequest) {
        adapter.fireBaseSignIn(with: userRequest) { result, error in
            if let error = error {
                self.errorCallback?(error.localizedDescription)
            } else {
                UserDefaults.standard.set(result?.user.uid, forKey: "userUid")
                self.successCallback?()
            }
        }
    }
}

