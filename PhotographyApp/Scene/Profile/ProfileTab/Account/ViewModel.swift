//
//  ViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 11.06.2023.
//

import Foundation
import UIKit


struct ProfileImageViewModel  {
    
    
    private let user: ProfileUser
    
    var followingString: NSAttributedString? {
        return attributedText(withValue: 1200, text: "Following")
    }
    
    var followersString: NSAttributedString? {
        return attributedText(withValue: 489, text: "Followers")
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
