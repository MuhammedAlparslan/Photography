//
//  Home.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.


import Foundation

struct Photos: Codable {
 
    let id                      : String?
    let slug                    : String?
    let created_at              : String?
    let updated_at              : String?
    let promoted_at             : String?
    let width                   : Int?
    let height                  : Int?
    let color                   : String?
    let blur_hash               : String?
    let description             : String?
    let alt_description         : String?
    let urls                    : URLS?
    let links                   : Links?
    let likes                   : Int?
    let liked_by_user           : Bool?
    var current_user_collections: [String] = []
    let sponsorship             : Sponsorship?
    let topic_submissions       : Topic_submissions?
    let user                    : User?
}

struct URLS: Codable {
    let raw         : String?
    let full        : String?
    let regular     : String?
    let small       : String?
    let thumb       : String?
    let small_s3    : String?
}

struct Links: Codable {
    let linksSelf           : String?
    let html                : String?
    let download            : String?
    let download_location   : String?
}

struct Sponsorship: Codable {
    var impression_urls     : [String] = []
    let tagline             : String?
    let tagline_url         : String?
    let sponsor             : Sponsor?
}

struct Sponsor: Codable {
    let id                 : String?
    let updated_at         : String?
    let username           : String?
    let name               : String?
    let first_name         : String?
    let last_name          : String?
    let twitter_username   : String?
    let portfolio_url      : String?
    let bio                : String?
    let location           : String?
    let links              : Linkss?
    let profile_image      : Profile_image?
    let total_collections  : Int?
    let total_likes        : Int?
    let total_photos       : Int?
    let accepted_tos       : Bool?
    let for_hire           : Bool?
    let social             : Social?
}

struct Linkss: Codable {
    let linksSelf   : String?
    let html        : String?
    let likes       : String?
    let portfolio   : String?
    let following   : String?
    let followers   : String?
}

struct Profile_image: Codable {
    let small       : String?
    let medium      : String?
    let large       : String?
}

struct Social: Codable {
    let instagram_username  : String?
    let portfolio_url       : String?
    let twitter_username    : String?
    let paypal_email        : String?
}

struct Topic_submissions: Codable {
    
}

struct User: Codable {
    let id                 : String?
    let updated_at         : String?
    let username           : String?
    let name               : String?
    let first_name         : String?
    let last_name          : String?
    let twitter_username   : String?
    let bio                : String?
    let location           : String?
    let links              : Linkks?
    let profile_image      : Profile_images?
    let instagram_username : String?
    let total_collections  : Int?
    let total_likes        : Int?
    let total_photos       : Int?
    let accepted_tos       : Bool?
    let for_hire           : Bool
    let social             : Sociall?
    

}

struct Linkks: Codable {
    let linksSelf   : String?
    let html        : String?
    let photos      : String?
    let likes       : String?
    let portfolio   : String?
    let following   : String?
    let followers   : String?
}

struct Profile_images: Codable {
    let small   : String?
    let medium  : String?
    let large   : String?
}

struct Sociall: Codable {
    let instagram_username   : String?
    let portfolio_url        : String?
    let twitter_username     : String?
    let paypal_email         : String?
}
