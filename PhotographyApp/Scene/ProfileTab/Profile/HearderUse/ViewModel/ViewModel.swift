//
//  ViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 11.06.2023.
//

import UIKit
import FirebaseCore
import FirebaseStorage
import SDWebImage
import FirebaseAuth

struct FollowViewModel  {
    
    
    private let user: ProfileUser
    
    var followingString: NSAttributedString? {
        return attributedText(withValue: 1200, text: " following")
    }
    
    var followersString: NSAttributedString? {
        return attributedText(withValue: 489, text: " followers")
    }
    
    init(user: ProfileUser) {
        self.user = user
    }
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedType = NSMutableAttributedString(string: "\(value)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedType.append(NSAttributedString(string: "\(text)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray.cgColor]))
        
        
        return attributedType
    }
    
    
    
    
    
}

