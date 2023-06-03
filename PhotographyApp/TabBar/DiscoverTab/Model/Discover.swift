//
//  Discover.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 3.06.2023.
//

import Foundation

struct Discover: Codable {
    let id: String?
    let slug: String?
    let title: String?
    let description: String?
    let published_at: String?
    let updated_at: String?
    let starts_at: String?
    let ends_at: String?
    let visibility: String?
    let featured: Bool?
    let total_photos: Int?
    let links: DiscoverLinks?
    let status: String?
    let owners: Owners?
    let cover_photo: CoverPhoto?
}


struct DiscoverLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf
        case html, download
        case downloadLocation
    }
}


struct Owners: Codable {
    let id: String?
    let updatedAt: Date?
    let username, name, firstName: String?
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: OwnersLinks?
    let profileImage: OwnersProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: OwnersSocial?
    
    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt
        case username, name
        case firstName
        case lastName
        case twitterUsername
        case portfolioURL
        case bio, location, links
        case profileImage
        case instagramUsername
        case totalCollections
        case totalLikes
        case totalPhotos
        case acceptedTos
        case forHire
        case social
    }
}
    
    struct OwnersLinks: Codable {
        let linksSelf, html, photos, likes: String?
        let portfolio, following, followers: String?
        
        enum CodingKeys: String, CodingKey {
            case linksSelf
            case html, photos, likes, portfolio, following, followers
        }
    }
    
    struct OwnersProfileImage: Codable {
        let small, medium, large: String?
    }
    
    struct OwnersSocial: Codable {
        let instagramUsername: String?
        let portfolioURL: String?
        let twitterUsername: String?
        
        enum CodingKeys: String, CodingKey {
            case instagramUsername
            case portfolioURL
            case twitterUsername
        }
    }
    
    
    struct CoverPhoto: Codable {
        let id, slug: String?
        let createdAt, updatedAt: Date?
        let promotedAt: Date?
        let width, height: Int?
        let color, blurHash: String?
        let description, altDescription: String?
        let urls: CoverUrls?
        let links: CoverPhotoLinks?
        let likes: Int?
        let likedByUser: Bool?
        let user: Owners?
        
        enum CodingKeys: String, CodingKey {
            case id, slug
            case createdAt
            case updatedAt
            case promotedAt
            case width, height, color
            case blurHash
            case description
            case altDescription
            case urls, links, likes
            case likedByUser
            case user
        }
    }
    
struct CoverUrls: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?
    
    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3
    }
}


