//
//  RegisterViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 20.05.2023.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES =  STORAGE_REF.child("profile_images")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
