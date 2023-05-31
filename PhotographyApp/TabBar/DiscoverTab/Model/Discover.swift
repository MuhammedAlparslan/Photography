//
//  Discover.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 31.05.2023.
//

import UIKit

// MARK: - Discover
struct Discover: Codable {
    let id, slug                        : String?
    let createdAt, updatedAt, promotedAt: Date?
    let width, height                   : Int?
    let color, blurHash                 : String?
    var description                     : [String] = []
    let altDescription                  : String?
    let urls                            : [DiscoverUrls]?
    let links                           : DiscoverLinks?
    let likes                           : Int?
    let likedByUser                     : Bool?
    var currentUserCollections          : [String] = []
    var sponsorship                     : [String] = []
    let topicSubmissions                : DiscoverTopicSubmissions?
    let user                            : DiscoverUser?
    let exif                            : Exif?
    let location                        : Location?
    let meta                            : Meta?
    let publicDomain                    : Bool?
    let tags                            : [DiscoverTag]?
    let tagsPreview                     : [TagsPreview]?
    let views, downloads                : Int?
    var topics                          : [String] = []

   
}

// MARK: - Exif
struct Exif: Codable {
    let make, model, name, exposureTime : String?
    let aperture, focalLength           : String?
    let iso                             : Int?

   
}

// MARK: - DiscoverLinks
struct DiscoverLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf        = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Location
struct Location: Codable {
    let name        : String?
    var city        : [String] = []
    let country     : String?
    let position    : Position?
}

// MARK: - Position
struct Position: Codable {
    let latitude, longitude: Double?
}

// MARK: - Meta
struct Meta: Codable {
    let index: Bool?
}

// MARK: - Tag
struct  DiscoverTag: Codable {
    let type        : TypeEnum?
    let title       : String?
    let source      : TagSource?
}

// MARK: - TagSource
struct TagSource: Codable {
    let ancestry                               : DiscoverAncestry?
    let title, subtitle, description, metaTitle: String?
    let metaDescription                        : String?
    let coverPhoto                             : DiscoverPurpleCoverPhoto?

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle, description
        case metaTitle              = "meta_title"
        case metaDescription        = "meta_description"
        case coverPhoto             = "cover_photo"
    }
}

// MARK: - Ancestry
struct DiscoverAncestry: Codable {
    let type, category, subcategory: DiscoverCategory?
}

// MARK: - Category
struct DiscoverCategory: Codable {
    let slug, prettySlug: String?

    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }
}

// MARK: - PurpleCoverPhoto
struct DiscoverPurpleCoverPhoto: Codable {
    let id, slug                    : String?
    let createdAt, updatedAt        : Date?
    let promotedAt                  : Date?
    let width, height               : Int?
    let color, blurHash             : String?
    let description                 : String?
    let altDescription              : String?
    let urls                        : DiscoverUrls?
    let links                       : DiscoverLinks?
    let likes                       : Int?
    let likedByUser                 : Bool?
    let currentUserCollections      : [String] = []
    let sponsorship                 : [String] = []
    let topicSubmissions            : DiscoverPurpleTopicSubmissions?
    let user                        : DiscoverUser?
    let premium, plus               : Bool?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt               = "created_at"
        case updatedAt               = "updated_at"
        case promotedAt              = "promoted_at"
        case width, height, color
        case blurHash                = "blur_hash"
        case description
        case altDescription          = "alt_description"
        case urls, links, likes
        case likedByUser             = "liked_by_user"
        case currentUserCollections  = "current_user_collections"
        case sponsorship
        case topicSubmissions        = "topic_submissions"
        case user, premium, plus
    }
}

// MARK: - PurpleTopicSubmissions
struct DiscoverPurpleTopicSubmissions: Codable {
    let nature, businessWork: BusinessWork?

    enum CodingKeys: String, CodingKey {
        case nature
        case businessWork = "business-work"
    }
}

// MARK: - BusinessWork
struct BusinessWork: Codable {
    let status    : String?
    let approvedOn: Date?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

// MARK: - Urls
struct DiscoverUrls: Codable, DiscoverCellProtocol  {
    let raw         : String?
    let full        : String?
    let regular     : String?
    let small       : String?
    let thumb       : String?
    let small_s3    : String?
    
    var imageURL: String {
        thumb ?? ""
    }
}

// MARK: - User
struct DiscoverUser: Codable {
    let id                       : String?
    let updatedAt                : Date?
    let username, name, firstName: String?
    let lastName, twitterUsername: String?
    let portfolioURL             : String?
    let bio                      : String?
    let location                 : String?
    let links                    : DiscoverUserLinks?
    let profileImage             : DiscoverProfileImage?
    let instagramUsername        : String?
    let totalCollections, totalLikes, totalPhotos: Int?
    let acceptedTos, forHire     : Bool?
    let social                   : DiscoverSocial?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt           = "updated_at"
        case username, name
        case firstName           = "first_name"
        case lastName            = "last_name"
        case twitterUsername     = "twitter_username"
        case portfolioURL        = "portfolio_url"
        case bio, location, links
        case profileImage        = "profile_image"
        case instagramUsername   = "instagram_username"
        case totalCollections    = "total_collections"
        case totalLikes          = "total_likes"
        case totalPhotos         = "total_photos"
        case acceptedTos         = "accepted_tos"
        case forHire             = "for_hire"
        case social
    }
}

// MARK: - UserLinks
struct DiscoverUserLinks: Codable {
    let linksSelf, html, photos, likes : String?
    let portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct DiscoverProfileImage: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct DiscoverSocial: Codable {
    let instagramUsername       : String?
    let portfolioURL            : String?
    let twitterUsername         : String?
    let paypalEmail             : [String] = []

    enum CodingKeys: String, CodingKey {
        case instagramUsername  = "instagram_username"
        case portfolioURL       = "portfolio_url"
        case twitterUsername    = "twitter_username"
        case paypalEmail        = "paypal_email"
    }
}

enum TypeEnum: String, Codable {
    case landingPage = "landing_page"
    case search      = "search"
}

// MARK: - TagsPreview
struct TagsPreview: Codable {
    let type        : TypeEnum?
    let title       : String?
    let source      : TagsPreviewSource?
}

// MARK: - TagsPreviewSource
struct TagsPreviewSource: Codable {
    let ancestry                                : Ancestry?
    let title, subtitle, description, metaTitle : String?
    let metaDescription                         : String?
    let coverPhoto                              : DiscoverFluffyCoverPhoto?

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle, description
        case metaTitle          = "meta_title"
        case metaDescription    = "meta_description"
        case coverPhoto         = "cover_photo"
    }
}

// MARK: - FluffyCoverPhoto
struct DiscoverFluffyCoverPhoto: Codable {
    let id, slug                                    : String?
    let createdAt, updatedAt, promotedAt            : Date?
    let width, height                               : Int?
    let color, blurHash, description, altDescription: String?
    let urls                                        : DiscoverUrls?
    let links                                       : DiscoverLinks?
    let likes                                       : Int?
    let likedByUser                                 : Bool?
    let currentUserCollections                      : [String] = []
    let sponsorship                                 : [String] = []
    let topicSubmissions                            : DiscoverFluffyTopicSubmissions?
    let user                                        : DiscoverUser?
    let premium, plus                               : Bool?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt               = "created_at"
        case updatedAt               = "updated_at"
        case promotedAt              = "promoted_at"
        case width, height, color
        case blurHash                = "blur_hash"
        case description
        case altDescription          = "alt_description"
        case urls, links, likes
        case likedByUser             = "liked_by_user"
        case currentUserCollections  = "current_user_collections"
        case sponsorship
        case topicSubmissions        = "topic_submissions"
        case user, premium, plus
    }
}

// MARK: - FluffyTopicSubmissions
struct DiscoverFluffyTopicSubmissions: Codable {
    let nature: BusinessWork?
}

// MARK: - DiscoverTopicSubmissions
struct DiscoverTopicSubmissions: Codable {
}




