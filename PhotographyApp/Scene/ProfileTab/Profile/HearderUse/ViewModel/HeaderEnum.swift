//
//  ProfileHeaderViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 14.06.2023.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
    case likes
    case post
    
    
    var description : String {
        switch self {
        case .likes:
            return "Likes"
        case .post:
            return "Post"

        }
    }
}
