//
//  Search.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 23.05.2023.
//

import Foundation

// MARK: - Search
struct Search: Codable {
    let total, totalPages: Int?
    let results: [SearchResult]?

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
     }
}

// MARK: - SearchResult
struct SearchResult: Codable {
    let id, title, description: String?
    let publishedAt, lastCollectedAt, updatedAt: String?
    let curated, featured: Bool?
    let totalPhotos: Int?
    let resultPrivate: Bool?
    let shareKey: String?
    let tags: [Tag]?
    let links: ResultLinks?
    let user: SearchUser?
    let coverPhoto: ResultCoverPhoto?
    let previewPhotos: [PreviewPhoto]?

    enum CodingKeys: String, CodingKey {
        case id, title, description
        case publishedAt         = "published_at"
        case lastCollectedAt     = "last_collected_at"
        case updatedAt           = "updated_at"
        case curated, featured
        case totalPhotos         = "total_photos"
        case resultPrivate       = "private"
        case shareKey            = "share_key"
        case tags, links, user
        case coverPhoto         = "cover_photo"
        case previewPhotos      = "preview_photos"
    }
}

// MARK: - ResultCoverPhoto
struct ResultCoverPhoto: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let promotedAt: String?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: Urls?
    let links: CoverPhotoLinks?
    let likes: Int?
    let likedByUser: Bool?
    let sponsorship: String?
    let topicSubmissions: PurpleTopicSubmissions?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt        = "created_at"
        case updatedAt        = "updated_at"
        case promotedAt       = "promoted_at"
        case width, height, color
        case blurHash         = "blur_hash"
        case description
        case altDescription   = "alt_description"
        case urls, links, likes
        case likedByUser      = "liked_by_user"
        case sponsorship
        case topicSubmissions = "topic_submissions"
        case user
    }
}

// MARK: - CoverPhotoLinks
struct CoverPhotoLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - PurpleTopicSubmissions
struct PurpleTopicSubmissions: Codable {
}

// MARK: - Urls
struct Urls: Codable, SearchProtocol {

    let raw, full, regular, small: String?
    let thumb, smallS3: String?
    
    var imageUrl: String  {
        small ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - User
struct SearchUser: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName, lastName: String?
    let twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks?
    let profileImage: ProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: Social?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
        case social
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
}

// MARK: - ResultLinks
struct ResultLinks: Codable {
    let linksSelf, html, photos, related: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, related
    }
}

// MARK: - PreviewPhoto
struct PreviewPhoto: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let blurHash: String?
    let urls: Urls?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case blurHash = "blur_hash"
        case urls
    }
}

// MARK: - Tag
struct Tag: Codable {
    let type, title: String?
    let source: Source?
}

// MARK: - Source
struct Source: Codable {
    let ancestry: Ancestry?
    let title, subtitle, description, metaTitle: String?
    let metaDescription: String?
    let coverPhoto: SourceCoverPhoto?

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle, description
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }
}

// MARK: - Ancestry
struct Ancestry: Codable {
    let type, category, subcategory: Category?
}

// MARK: - Category
struct Category: Codable {
    let slug, prettySlug: String?

    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }
}

// MARK: - SourceCoverPhoto
struct SourceCoverPhoto: Codable {
    let id: String?
    let createdAt, updatedAt: String?
    let promotedAt: String?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: Urls?
    let links: CoverPhotoLinks?
    let likes: Int?
    let likedByUser: Bool?
    let topicSubmissions: FluffyTopicSubmissions?
    let premium, plus: Bool?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case topicSubmissions = "topic_submissions"
        case premium, plus, user
    }
}

// MARK: - FluffyTopicSubmissions
struct FluffyTopicSubmissions: Codable {
    let texturesPatterns: TexturesPatterns?

    enum CodingKeys: String, CodingKey {
        case texturesPatterns = "textures-patterns"
    }
}

// MARK: - TexturesPatterns
struct TexturesPatterns: Codable {
    let status: String?
    let approvedOn: String?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}
