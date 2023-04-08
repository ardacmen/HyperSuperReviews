// WelcomeElement.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcomeElement = try? newJSONDecoder().decode(WelcomeElement.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct Posts: Codable {
    var id: Int?
    var date, dateGmt: String?
    var guid: GUID?
    var modified, modifiedGmt, slug: String?
    var status: StatusEnum?
    var type: WelcomeType?
    var link: String?
    var title: GUID?
    var content, excerpt: Content?
    var author, featuredMedia: Int?
    var commentStatus, pingStatus: Status?
    var sticky: Bool?
    var template: String?
    var format: Format?
    var meta: [JSONAny]?
    var categories, tags: [Int]?
    var yoastHead: String?
    var yoastHeadJSON: WelcomeYoastHeadJSON?
    var links: WelcomeLinks?
    var embedded: Embedded?

    enum CodingKeys: String, CodingKey {
        case id, date
        case dateGmt
        case guid, modified
        case modifiedGmt
        case slug, status, type, link, title, content, excerpt, author
        case featuredMedia
        case commentStatus
        case pingStatus
        case sticky, template, format, meta, categories, tags
        case yoastHead
        case yoastHeadJSON
        case links
        case embedded
    }
}

// Status.swift

import Foundation

enum Status: String, Codable {
    case closed = "closed"
}

// Content.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let content = try? newJSONDecoder().decode(Content.self, from: jsonData)

import Foundation

// MARK: - Content
struct Content: Codable {
    var rendered: String?
    var protected: Bool?
}

// Embedded.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let embedded = try? newJSONDecoder().decode(Embedded.self, from: jsonData)

import Foundation

// MARK: - Embedded
struct Embedded: Codable {
    var author: [EmbeddedAuthor]?
    var wpFeaturedmedia: [WpFeaturedmedia]?
    var wpTerm: [[EmbeddedWpTerm]]?

    enum CodingKeys: String, CodingKey {
        case author
        case wpFeaturedmedia
        case wpTerm
    }
}

// EmbeddedAuthor.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let embeddedAuthor = try? newJSONDecoder().decode(EmbeddedAuthor.self, from: jsonData)

import Foundation

// MARK: - EmbeddedAuthor
struct EmbeddedAuthor: Codable {
    var id: Int?
    var name: AuthorEnum?
    var url: String?
    var description: String?
    var link: String?
    var slug: Slug?
    var avatarUrls: [String: String]?
    var yoastHead: String?
    var yoastHeadJSON: AuthorYoastHeadJSON?
    var links: AuthorLinks?

    enum CodingKeys: String, CodingKey {
        case id, name, url, description, link, slug
        case avatarUrls
        case yoastHead
        case yoastHeadJSON
        case links
    }
}

// AuthorLinks.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let authorLinks = try? newJSONDecoder().decode(AuthorLinks.self, from: jsonData)

import Foundation

// MARK: - AuthorLinks
struct AuthorLinks: Codable {
    var linksSelf, collection: [About]?

    enum CodingKeys: String, CodingKey {
        case linksSelf
        case collection
    }
}

// About.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let about = try? newJSONDecoder().decode(About.self, from: jsonData)

import Foundation

// MARK: - About
struct About: Codable {
    var href: String?
}

// AuthorEnum.swift

import Foundation

enum AuthorEnum: String, Codable {
    case hyperSuperReviews = "Hyper Super Reviews"
    case yonetici = "Yonetici"
    case yoneticiAuthorAtHyperSuperReviews = "Yonetici, Author at Hyper Super Reviews"
}

// Slug.swift

import Foundation

enum Slug: String, Codable {
    case yonetici = "yonetici"
}

// AuthorYoastHeadJSON.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let authorYoastHeadJSON = try? newJSONDecoder().decode(AuthorYoastHeadJSON.self, from: jsonData)

import Foundation

// MARK: - AuthorYoastHeadJSON
struct AuthorYoastHeadJSON: Codable {
    var title: AuthorEnum?
    var robots: Robots?
    var canonical: String?
    var ogLocale: OgLocale?
    var ogType: PurpleOgType?
    var ogTitle: AuthorEnum?
    var ogURL: String?
    var ogSiteName: AuthorEnum?
    var ogImage: [PurpleOgImage]?
    var twitterCard: TwitterCard?
    var schema: PurpleSchema?

    enum CodingKeys: String, CodingKey {
        case title, robots, canonical
        case ogLocale
        case ogType
        case ogTitle
        case ogURL
        case ogSiteName
        case ogImage
        case twitterCard
        case schema
    }
}

// PurpleOgImage.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let purpleOgImage = try? newJSONDecoder().decode(PurpleOgImage.self, from: jsonData)

import Foundation

// MARK: - PurpleOgImage
struct PurpleOgImage: Codable {
    var url: String?
}

// OgLocale.swift

import Foundation

enum OgLocale: String, Codable {
    case enUS = "en_US"
}

// PurpleOgType.swift

import Foundation

enum PurpleOgType: String, Codable {
    case profile = "profile"
}

// Robots.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let robots = try? newJSONDecoder().decode(Robots.self, from: jsonData)

import Foundation

// MARK: - Robots
struct Robots: Codable {
    var index: Index?
    var follow: Follow?
    var maxSnippet: MaxSnippet?
    var maxImagePreview: MaxImagePreview?
    var maxVideoPreview: MaxVideoPreview?

    enum CodingKeys: String, CodingKey {
        case index, follow
        case maxSnippet
        case maxImagePreview
        case maxVideoPreview
    }
}

// Follow.swift

import Foundation

enum Follow: String, Codable {
    case follow = "follow"
}

// Index.swift

import Foundation

enum Index: String, Codable {
    case index = "index"
}

// MaxImagePreview.swift

import Foundation

enum MaxImagePreview: String, Codable {
    case maxImagePreviewLarge = "max-image-preview:large"
}

// MaxSnippet.swift

import Foundation

enum MaxSnippet: String, Codable {
    case maxSnippet1 = "max-snippet:-1"
}

// MaxVideoPreview.swift

import Foundation

enum MaxVideoPreview: String, Codable {
    case maxVideoPreview1 = "max-video-preview:-1"
}

// PurpleSchema.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let purpleSchema = try? newJSONDecoder().decode(PurpleSchema.self, from: jsonData)

import Foundation

// MARK: - PurpleSchema
struct PurpleSchema: Codable {
    var context: String?
    var graph: [PurpleGraph]?

    enum CodingKeys: String, CodingKey {
        case context
        case graph
    }
}

// PurpleGraph.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let purpleGraph = try? newJSONDecoder().decode(PurpleGraph.self, from: jsonData)

import Foundation

// MARK: - PurpleGraph
struct PurpleGraph: Codable {
    var type: IndigoType?
    var id, url: String?
    var name: AuthorEnum?
    var isPartOf, breadcrumb: Breadcrumb?
    var inLanguage: InLanguage?
    var potentialAction: [PurplePotentialAction]?
    var itemListElement: [ItemListElement]?
    var description: String?
    var publisher: Breadcrumb?
    var image: Image?
    var logo: Breadcrumb?
    var sameAs: [String]?
    var mainEntityOfPage: Breadcrumb?

    enum CodingKeys: String, CodingKey {
        case type
        case id
        case url, name, isPartOf, breadcrumb, inLanguage, potentialAction, itemListElement, description, publisher, image, logo, sameAs, mainEntityOfPage
    }
}

// Breadcrumb.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let breadcrumb = try? newJSONDecoder().decode(Breadcrumb.self, from: jsonData)

import Foundation

// MARK: - Breadcrumb
struct Breadcrumb: Codable {
    var id: String?

    enum CodingKeys: String, CodingKey {
        case id
    }
}

// Image.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let image = try? newJSONDecoder().decode(Image.self, from: jsonData)

import Foundation

// MARK: - Image
struct Image: Codable {
    var type: ImageType?
    var inLanguage: InLanguage?
    var id: String?
    var url, contentURL: String?
    var caption: AuthorEnum?
    var width, height: Int?

    enum CodingKeys: String, CodingKey {
        case type
        case inLanguage
        case id
        case url
        case contentURL
        case caption, width, height
    }
}

// InLanguage.swift

import Foundation

enum InLanguage: String, Codable {
    case enUS = "en-US"
}

// ImageType.swift

import Foundation

enum ImageType: String, Codable {
    case imageObject = "ImageObject"
}

// ItemListElement.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let itemListElement = try? newJSONDecoder().decode(ItemListElement.self, from: jsonData)

import Foundation

// MARK: - ItemListElement
struct ItemListElement: Codable {
    var type: ItemListElementType?
    var position: Int?
    var name: String?
    var item: String?

    enum CodingKeys: String, CodingKey {
        case type
        case position, name, item
    }
}

// ItemListElementType.swift

import Foundation

enum ItemListElementType: String, Codable {
    case listItem = "ListItem"
}

// PurplePotentialAction.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let purplePotentialAction = try? newJSONDecoder().decode(PurplePotentialAction.self, from: jsonData)

import Foundation

// MARK: - PurplePotentialAction
struct PurplePotentialAction: Codable {
    var type: PotentialActionType?
    var target: TargetUnion?
    var queryInput: QueryInput?

    enum CodingKeys: String, CodingKey {
        case type
        case target
        case queryInput
    }
}

// QueryInput.swift

import Foundation

enum QueryInput: String, Codable {
    case requiredNameSearchTermString = "required name=search_term_string"
}

// TargetUnion.swift

import Foundation

enum TargetUnion: Codable {
    case stringArray([String])
    case targetClass(TargetClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(TargetClass.self) {
            self = .targetClass(x)
            return
        }
        throw DecodingError.typeMismatch(TargetUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for TargetUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .stringArray(let x):
            try container.encode(x)
        case .targetClass(let x):
            try container.encode(x)
        }
    }
}

// TargetClass.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let targetClass = try? newJSONDecoder().decode(TargetClass.self, from: jsonData)

import Foundation

// MARK: - TargetClass
struct TargetClass: Codable {
    var type: TargetType?
    var urlTemplate: URLTemplate?

    enum CodingKeys: String, CodingKey {
        case type
        case urlTemplate
    }
}

// TargetType.swift

import Foundation

enum TargetType: String, Codable {
    case entryPoint = "EntryPoint"
}

// URLTemplate.swift

import Foundation

enum URLTemplate: String, Codable {
    case httpWWWHypersuperprojectsCOMSSearchTermString = "http://www.hypersuperprojects.com/?s={search_term_string}"
}

// PotentialActionType.swift

import Foundation

enum PotentialActionType: String, Codable {
    case readAction = "ReadAction"
    case searchAction = "SearchAction"
}

// IndigoType.swift

import Foundation

enum IndigoType: Codable {
    case enumArray([TypeElement])
    case enumeration(PurpleType)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([TypeElement].self) {
            self = .enumArray(x)
            return
        }
        if let x = try? container.decode(PurpleType.self) {
            self = .enumeration(x)
            return
        }
        throw DecodingError.typeMismatch(IndigoType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for IndigoType"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumArray(let x):
            try container.encode(x)
        case .enumeration(let x):
            try container.encode(x)
        }
    }
}

// TypeElement.swift

import Foundation

enum TypeElement: String, Codable {
    case organization = "Organization"
    case person = "Person"
}

// PurpleType.swift

import Foundation

enum PurpleType: String, Codable {
    case breadcrumbList = "BreadcrumbList"
    case profilePage = "ProfilePage"
    case webSite = "WebSite"
}

// TwitterCard.swift

import Foundation

enum TwitterCard: String, Codable {
    case summaryLargeImage = "summary_large_image"
}

// WpFeaturedmedia.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wpFeaturedmedia = try? newJSONDecoder().decode(WpFeaturedmedia.self, from: jsonData)

import Foundation

// MARK: - WpFeaturedmedia
struct WpFeaturedmedia: Codable {
    var id: Int?
    var date, slug: String?
    var type: FluffyType?
    var link: String?
    var title: GUID?
    var author: Int?
    var smush: SmushUnion?
    var caption: GUID?
    var altText: String?
    var mediaType: MediaType?
    var mimeType: MIMETypeEnum?
    var mediaDetails: MediaDetails?
    var sourceURL: String?
    var links: WpFeaturedmediaLinks?

    enum CodingKeys: String, CodingKey {
        case id, date, slug, type, link, title, author, smush, caption
        case altText
        case mediaType
        case mimeType
        case mediaDetails
        case sourceURL
        case links
    }
}

// GUID.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gUID = try? newJSONDecoder().decode(GUID.self, from: jsonData)

import Foundation

// MARK: - GUID
struct GUID: Codable {
    var rendered: String?
}

// WpFeaturedmediaLinks.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wpFeaturedmediaLinks = try? newJSONDecoder().decode(WpFeaturedmediaLinks.self, from: jsonData)

import Foundation

// MARK: - WpFeaturedmediaLinks
struct WpFeaturedmediaLinks: Codable {
    var linksSelf, collection, about: [About]?
    var author, replies: [ReplyElement]?

    enum CodingKeys: String, CodingKey {
        case linksSelf
        case collection, about, author, replies
    }
}

// ReplyElement.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let replyElement = try? newJSONDecoder().decode(ReplyElement.self, from: jsonData)

import Foundation

// MARK: - ReplyElement
struct ReplyElement: Codable {
    var embeddable: Bool?
    var href: String?
}

// MediaDetails.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mediaDetails = try? newJSONDecoder().decode(MediaDetails.self, from: jsonData)

import Foundation

// MARK: - MediaDetails
struct MediaDetails: Codable {
    var width, height: Int?
    var file: String?
    var filesize: Int?
    var sizes: MediaDetailsSizes?
    var imageMeta: ImageMeta?

    enum CodingKeys: String, CodingKey {
        case width, height, file, filesize, sizes
        case imageMeta
    }
}

// ImageMeta.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let imageMeta = try? newJSONDecoder().decode(ImageMeta.self, from: jsonData)

import Foundation

// MARK: - ImageMeta
struct ImageMeta: Codable {
    var aperture: String?
    var credit: Credit?
    var camera, caption, createdTimestamp, copyright: String?
    var focalLength, iso, shutterSpeed, title: String?
    var orientation: String?
    var keywords: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case aperture, credit, camera, caption
        case createdTimestamp
        case copyright
        case focalLength
        case iso
        case shutterSpeed
        case title, orientation, keywords
    }
}

// Credit.swift

import Foundation

enum Credit: String, Codable {
    case empty = ""
    case frankOckenfels3AMC = "Frank Ockenfels 3/AMC"
}

// MediaDetailsSizes.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mediaDetailsSizes = try? newJSONDecoder().decode(MediaDetailsSizes.self, from: jsonData)

import Foundation

// MARK: - MediaDetailsSizes
struct MediaDetailsSizes: Codable {
    var thumbnail, wpMagazineHeaderAdImage, full, medium: FullClass?
    var large, mediumLarge, the1536X1536: FullClass?

    enum CodingKeys: String, CodingKey {
        case thumbnail
        case wpMagazineHeaderAdImage
        case full, medium, large
        case mediumLarge
        case the1536X1536
    }
}

// FullClass.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fullClass = try? newJSONDecoder().decode(FullClass.self, from: jsonData)

import Foundation

// MARK: - FullClass
struct FullClass: Codable {
    var file: String?
    var width, height, filesize: Int?
    var mimeType: MIMETypeEnum?
    var sourceURL: String?

    enum CodingKeys: String, CodingKey {
        case file, width, height, filesize
        case mimeType
        case sourceURL
    }
}

// MIMETypeEnum.swift

import Foundation

enum MIMETypeEnum: String, Codable {
    case imageJPEG = "image/jpeg"
    case imagePNG = "image/png"
    case imageWebp = "image/webp"
}

// MediaType.swift

import Foundation

enum MediaType: String, Codable {
    case image = "image"
}

// SmushUnion.swift

import Foundation

enum SmushUnion: Codable {
    case smushClass(SmushClass)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(SmushClass.self) {
            self = .smushClass(x)
            return
        }
        throw DecodingError.typeMismatch(SmushUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SmushUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .smushClass(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// SmushClass.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let smushClass = try? newJSONDecoder().decode(SmushClass.self, from: jsonData)

import Foundation

// MARK: - SmushClass
struct SmushClass: Codable {
    var stats: Stats?
    var sizes: SmushSizes?
}

// SmushSizes.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let smushSizes = try? newJSONDecoder().decode(SmushSizes.self, from: jsonData)

import Foundation

// MARK: - SmushSizes
struct SmushSizes: Codable {
    var wpMagazineHeaderAdImage, thumbnail, medium, large: Purple1536_X1536?
    var mediumLarge, the1536X1536: Purple1536_X1536?

    enum CodingKeys: String, CodingKey {
        case wpMagazineHeaderAdImage
        case thumbnail, medium, large
        case mediumLarge
        case the1536X1536
    }
}

// Purple1536_X1536.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let purple1536X1536 = try? newJSONDecoder().decode(Purple1536_X1536.self, from: jsonData)

import Foundation

// MARK: - Purple1536_X1536
struct Purple1536_X1536: Codable {
    var percent: Double?
    var bytes, sizeBefore, sizeAfter: Int?
    var time: Double?

    enum CodingKeys: String, CodingKey {
        case percent, bytes
        case sizeBefore
        case sizeAfter
        case time
    }
}

// Stats.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let stats = try? newJSONDecoder().decode(Stats.self, from: jsonData)

import Foundation

// MARK: - Stats
struct Stats: Codable {
    var percent: Double?
    var bytes, sizeBefore, sizeAfter: Int?
    var time: Double?
    var apiVersion: String?
    var lossy: Bool?
    var keepExif: Int?

    enum CodingKeys: String, CodingKey {
        case percent, bytes
        case sizeBefore
        case sizeAfter
        case time
        case apiVersion
        case lossy
        case keepExif
    }
}

// FluffyType.swift

import Foundation

enum FluffyType: String, Codable {
    case attachment = "attachment"
}

// EmbeddedWpTerm.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let embeddedWpTerm = try? newJSONDecoder().decode(EmbeddedWpTerm.self, from: jsonData)

import Foundation

// MARK: - EmbeddedWpTerm
struct EmbeddedWpTerm: Codable {
    var id: Int?
    var link: String?
    var name, slug: String?
    var taxonomy: Taxonomy?
    var yoastHead: String?
    var yoastHeadJSON: WpTermYoastHeadJSON?
    var links: WpTermLinks?

    enum CodingKeys: String, CodingKey {
        case id, link, name, slug, taxonomy
        case yoastHead
        case yoastHeadJSON
        case links
    }
}

// WpTermLinks.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wpTermLinks = try? newJSONDecoder().decode(WpTermLinks.self, from: jsonData)

import Foundation

// MARK: - WpTermLinks
struct WpTermLinks: Codable {
    var linksSelf, collection, about, wpPostType: [About]?
    var curies: [Cury]?

    enum CodingKeys: String, CodingKey {
        case linksSelf
        case collection, about
        case wpPostType
        case curies
    }
}

// Cury.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cury = try? newJSONDecoder().decode(Cury.self, from: jsonData)

import Foundation

// MARK: - Cury
struct Cury: Codable {
    var name: Name?
    var href: Href?
    var templated: Bool?
}

// Href.swift

import Foundation

enum Href: String, Codable {
    case httpsAPIWOrgRel = "https://api.w.org/{rel}"
}

// Name.swift

import Foundation

enum Name: String, Codable {
    case wp = "wp"
}

// Taxonomy.swift

import Foundation

enum Taxonomy: String, Codable {
    case category = "category"
    case postTag = "post_tag"
}

// WpTermYoastHeadJSON.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wpTermYoastHeadJSON = try? newJSONDecoder().decode(WpTermYoastHeadJSON.self, from: jsonData)

import Foundation

// MARK: - WpTermYoastHeadJSON
struct WpTermYoastHeadJSON: Codable {
    var title: String?
    var robots: Robots?
    var canonical: String?
    var ogLocale: OgLocale?
    var ogType: FluffyOgType?
    var ogTitle: String?
    var ogURL: String?
    var ogSiteName: AuthorEnum?
    var twitterCard: TwitterCard?
    var schema: FluffySchema?

    enum CodingKeys: String, CodingKey {
        case title, robots, canonical
        case ogLocale
        case ogType
        case ogTitle
        case ogURL
        case ogSiteName
        case twitterCard
        case schema
    }
}

// FluffyOgType.swift

import Foundation

enum FluffyOgType: String, Codable {
    case article = "article"
}

// FluffySchema.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fluffySchema = try? newJSONDecoder().decode(FluffySchema.self, from: jsonData)

import Foundation

// MARK: - FluffySchema
struct FluffySchema: Codable {
    var context: String?
    var graph: [FluffyGraph]?

    enum CodingKeys: String, CodingKey {
        case context
        case graph
    }
}

// FluffyGraph.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fluffyGraph = try? newJSONDecoder().decode(FluffyGraph.self, from: jsonData)

import Foundation

// MARK: - FluffyGraph
struct FluffyGraph: Codable {
    var type: IndecentType?
    var id, url: String?
    var name: String?
    var isPartOf, breadcrumb: Breadcrumb?
    var inLanguage: InLanguage?
    var itemListElement: [ItemListElement]?
    var description: String?
    var publisher: Breadcrumb?
    var potentialAction: [FluffyPotentialAction]?
    var image: Image?
    var logo: Breadcrumb?
    var sameAs: [String]?

    enum CodingKeys: String, CodingKey {
        case type
        case id
        case url, name, isPartOf, breadcrumb, inLanguage, itemListElement, description, publisher, potentialAction, image, logo, sameAs
    }
}

// FluffyPotentialAction.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fluffyPotentialAction = try? newJSONDecoder().decode(FluffyPotentialAction.self, from: jsonData)

import Foundation

// MARK: - FluffyPotentialAction
struct FluffyPotentialAction: Codable {
    var type: PotentialActionType?
    var target: TargetClass?
    var queryInput: QueryInput?

    enum CodingKeys: String, CodingKey {
        case type
        case target
        case queryInput
    }
}

// IndecentType.swift

import Foundation

enum IndecentType: Codable {
    case enumArray([TypeElement])
    case enumeration(TentacledType)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([TypeElement].self) {
            self = .enumArray(x)
            return
        }
        if let x = try? container.decode(TentacledType.self) {
            self = .enumeration(x)
            return
        }
        throw DecodingError.typeMismatch(IndecentType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for IndecentType"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumArray(let x):
            try container.encode(x)
        case .enumeration(let x):
            try container.encode(x)
        }
    }
}

// TentacledType.swift

import Foundation

enum TentacledType: String, Codable {
    case breadcrumbList = "BreadcrumbList"
    case collectionPage = "CollectionPage"
    case webSite = "WebSite"
}

// Format.swift

import Foundation

enum Format: String, Codable {
    case standard = "standard"
}

// WelcomeLinks.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcomeLinks = try? newJSONDecoder().decode(WelcomeLinks.self, from: jsonData)

import Foundation

// MARK: - WelcomeLinks
struct WelcomeLinks: Codable {
    var linksSelf, collection, about: [About]?
    var author, replies: [ReplyElement]?
    var versionHistory: [VersionHistory]?
    var predecessorVersion: [PredecessorVersion]?
    var wpFeaturedmedia: [ReplyElement]?
    var wpAttachment: [About]?
    var wpTerm: [LinksWpTerm]?
    var curies: [Cury]?

    enum CodingKeys: String, CodingKey {
        case linksSelf
        case collection, about, author, replies
        case versionHistory
        case predecessorVersion
        case wpFeaturedmedia
        case wpAttachment
        case wpTerm
        case curies
    }
}

// PredecessorVersion.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let predecessorVersion = try? newJSONDecoder().decode(PredecessorVersion.self, from: jsonData)

import Foundation

// MARK: - PredecessorVersion
struct PredecessorVersion: Codable {
    var id: Int?
    var href: String?
}

// VersionHistory.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let versionHistory = try? newJSONDecoder().decode(VersionHistory.self, from: jsonData)

import Foundation

// MARK: - VersionHistory
struct VersionHistory: Codable {
    var count: Int?
    var href: String?
}

// LinksWpTerm.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let linksWpTerm = try? newJSONDecoder().decode(LinksWpTerm.self, from: jsonData)

import Foundation

// MARK: - LinksWpTerm
struct LinksWpTerm: Codable {
    var taxonomy: Taxonomy?
    var embeddable: Bool?
    var href: String?
}

// StatusEnum.swift

import Foundation

enum StatusEnum: String, Codable {
    case publish = "publish"
}

// WelcomeType.swift

import Foundation

enum WelcomeType: String, Codable {
    case post = "post"
}

// WelcomeYoastHeadJSON.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcomeYoastHeadJSON = try? newJSONDecoder().decode(WelcomeYoastHeadJSON.self, from: jsonData)

import Foundation

// MARK: - WelcomeYoastHeadJSON
struct WelcomeYoastHeadJSON: Codable {
    var title, description: String?
    var robots: Robots?
    var canonical: String?
    var ogLocale: OgLocale?
    var ogType: FluffyOgType?
    var ogTitle, ogDescription: String?
    var ogURL: String?
    var ogSiteName: AuthorEnum?
    var articlePublishedTime, articleModifiedTime: Date?
    var ogImage: [FluffyOgImage]?
    var author: AuthorEnum?
    var twitterCard: TwitterCard?
    var twitterMisc: TwitterMisc?
    var schema: TentacledSchema?

    enum CodingKeys: String, CodingKey {
        case title, description, robots, canonical
        case ogLocale
        case ogType
        case ogTitle
        case ogDescription
        case ogURL
        case ogSiteName
        case articlePublishedTime
        case articleModifiedTime
        case ogImage
        case author
        case twitterCard
        case twitterMisc
        case schema
    }
}

// FluffyOgImage.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fluffyOgImage = try? newJSONDecoder().decode(FluffyOgImage.self, from: jsonData)

import Foundation

// MARK: - FluffyOgImage
struct FluffyOgImage: Codable {
    var width, height: Int?
    var url: String?
    var type: MIMETypeEnum?
}

// TentacledSchema.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tentacledSchema = try? newJSONDecoder().decode(TentacledSchema.self, from: jsonData)

import Foundation

// MARK: - TentacledSchema
struct TentacledSchema: Codable {
    var context: String?
    var graph: [TentacledGraph]?

    enum CodingKeys: String, CodingKey {
        case context
        case graph
    }
}

// TentacledGraph.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tentacledGraph = try? newJSONDecoder().decode(TentacledGraph.self, from: jsonData)

import Foundation

// MARK: - TentacledGraph
struct TentacledGraph: Codable {
    var type: HilariousType?
    var id: String?
    var isPartOf: Breadcrumb?
    var author: GraphAuthorClass?
    var headline: String?
    var datePublished, dateModified: Date?
    var mainEntityOfPage: Breadcrumb?
    var wordCount: Int?
    var publisher: Breadcrumb?
    var keywords: [String]?
    var articleSection: [ArticleSection]?
    var inLanguage: InLanguage?
    var url: String?
    var name, description: String?
    var breadcrumb: Breadcrumb?
    var potentialAction: [PurplePotentialAction]?
    var itemListElement: [ItemListElement]?
    var image: Image?
    var logo: Breadcrumb?
    var sameAs: [String]?

    enum CodingKeys: String, CodingKey {
        case type
        case id
        case isPartOf, author, headline, datePublished, dateModified, mainEntityOfPage, wordCount, publisher, keywords, articleSection, inLanguage, url, name, description, breadcrumb, potentialAction, itemListElement, image, logo, sameAs
    }
}

// ArticleSection.swift

import Foundation

enum ArticleSection: String, Codable {
    case animation = "Animation"
    case film = "Film"
    case series = "Series"
}

// GraphAuthorClass.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let graphAuthorClass = try? newJSONDecoder().decode(GraphAuthorClass.self, from: jsonData)

import Foundation

// MARK: - GraphAuthorClass
struct GraphAuthorClass: Codable {
    var name: AuthorEnum?
    var id: String?

    enum CodingKeys: String, CodingKey {
        case name
        case id
    }
}

// HilariousType.swift

import Foundation

enum HilariousType: Codable {
    case enumArray([TypeElement])
    case enumeration(StickyType)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([TypeElement].self) {
            self = .enumArray(x)
            return
        }
        if let x = try? container.decode(StickyType.self) {
            self = .enumeration(x)
            return
        }
        throw DecodingError.typeMismatch(HilariousType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for HilariousType"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumArray(let x):
            try container.encode(x)
        case .enumeration(let x):
            try container.encode(x)
        }
    }
}

// StickyType.swift

import Foundation

enum StickyType: String, Codable {
    case article = "Article"
    case breadcrumbList = "BreadcrumbList"
    case webPage = "WebPage"
    case webSite = "WebSite"
}

// TwitterMisc.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let twitterMisc = try? newJSONDecoder().decode(TwitterMisc.self, from: jsonData)

import Foundation

// MARK: - TwitterMisc
struct TwitterMisc: Codable {
    var writtenBy: AuthorEnum?
    var estReadingTime: EstReadingTime?

    enum CodingKeys: String, CodingKey {
        case writtenBy
        case estReadingTime
    }
}

// EstReadingTime.swift

import Foundation

enum EstReadingTime: String, Codable {
    case the1Minute = "1 minute"
    case the2Minutes = "2 minutes"
    case the3Minutes = "3 minutes"
}

// JSONSchemaSupport.swift

import Foundation

typealias Welcome = [Posts]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

