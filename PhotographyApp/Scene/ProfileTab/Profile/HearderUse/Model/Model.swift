//
//  Model.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 11.06.2023.
//
import UIKit
import FirebaseAuth


struct ProfileUser {
    let fullname    : String
    let email       : String
    let username    : String
    var profileImage: URL?
    let uid         : String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == uid}
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        
        self.fullname     = dictionary["fullname"]      as? String ?? ""
        self.username     = dictionary["username"]      as? String ?? ""
        self.email        = dictionary["email"]         as? String ?? ""
        
        if let profileImageString = dictionary["profileImage"] as? String {
            guard let url = URL(string: profileImageString) else { return }
            self.profileImage = url
        }

    }
}
