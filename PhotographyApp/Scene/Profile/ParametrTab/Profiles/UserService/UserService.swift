//
//  UserService.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 11.06.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

struct UserService {
    
    static let shared = UserService()
    
    func fetchUser(uid: String ,completion: @escaping (ProfileUser) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot  in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            let user = ProfileUser(uid: uid, dictionary: dictionary)
            completion(user)
            
         }
    }
}
