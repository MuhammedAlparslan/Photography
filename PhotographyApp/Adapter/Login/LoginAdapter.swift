//
//  LoginAdapter.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class LoginAdapter {
    
    func fireBaseSignIn(with userRequest: LoginUserRequest, completion: @escaping (AuthDataResult?, Error?) -> Void) {        
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password, completion: completion)
    }
}
