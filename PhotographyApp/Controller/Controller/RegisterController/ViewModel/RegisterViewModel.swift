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
    
    let adapter = RegisterAdapter()

    var succesCallback: (()->())?
    var errorCallback: ((String)->())?
    

    
    
    func signupUser(data: Register) {
        adapter.registerUser(credentials: data) { error in
            if let error = error {
                self.errorCallback?(error)
            } else {
                self.succesCallback?()
            }
        }
    }
}
