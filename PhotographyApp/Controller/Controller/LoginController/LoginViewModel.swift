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

struct LoginUserRequest {
    let email: String
    let password: String
}

class LoginViewModel {
    static let shared = LoginViewModel()
    
    public func signIn(with userRequest: LoginUserRequest, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: userRequest.email,password: userRequest.password) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
}

