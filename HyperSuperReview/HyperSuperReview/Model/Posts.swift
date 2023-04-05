// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome10 = try Welcome10(json)

import Foundation

// MARK: - Welcome10Element
struct Posts : Codable  {
    let id: Int?
    let date, dateGmt: String?
    let guid: GUID?
    let modified, modifiedGmt, slug: String?
    let link: String?
    let title: GUID?
    let content, excerpt: Content?
    let author, featuredMedia: Int?
    let sticky: Bool?
    let template: String?
    let format: Format?
    let categories, tags: [Int]?
    let yoastHead: String?
    let yoastHeadJSON: YoastHeadJSON?
    let links: Links?
}

enum Status  : String, Codable {
    case closed
}

// MARK: - Content
struct Content  :  Codable {
    let rendered: String
    let protected: Bool
}

enum Format  : String, Codable {
    case standard
}

// MARK: - GUID
struct GUID  :  Codable {
    let rendered: String
}

// MARK: - Links
struct Links  :  Codable {
    let linksSelf, collection, about: [About]
    let author, replies: [AuthorElement]
    let versionHistory: [VersionHistory]
    let predecessorVersion: [PredecessorVersion]
    let wpFeaturedmedia: [AuthorElement]
    let wpAttachment: [About]
    let wpTerm: [WpTerm]
    let curies: [Cury]
}

// MARK: - About
struct About : Codable {
    let href: String
}

// MARK: - AuthorElement
struct AuthorElement : Codable{
    let embeddable: Bool
    let href: String
}

// MARK: - Cury
struct Cury : Codable{
    let name: Name
    let href: Href
    let templated: Bool
}

enum Href  : String, Codable {
    case httpsAPIWOrgRel
}

enum Name  : String, Codable {
    case wp
}

// MARK: - PredecessorVersion
struct PredecessorVersion : Codable{
    let id: Int
    let href: String
}

// MARK: - VersionHistory
struct VersionHistory : Codable{
    let count: Int
    let href: String
}

// MARK: - WpTerm
struct WpTerm : Codable{
    let taxonomy: Taxonomy
    let embeddable: Bool
    let href: String
}

enum Taxonomy : String, Codable  {
    case category
    case postTag
}

enum StatusEnum  : String, Codable  {
    case publish
}

enum Welcome10Type  : String, Codable {
    case post
}

// MARK: - YoastHeadJSON
struct YoastHeadJSON : Codable {
    let title: String
    let yoastHeadJSONDescription: String?
    let robots: Robots
    let canonical: String
    let ogLocale: OgLocale
    let ogType: OgType
    let ogTitle, ogDescription: String
    let ogURL: String
    let ogSiteName: OgSiteName
    let articlePublishedTime, articleModifiedTime: Date
    let ogImage: [OgImage]
    let author: AuthorEnum
    let twitterCard: TwitterCard
    let twitterMisc: TwitterMisc
    let schema: Schema
}

enum AuthorEnum  : String, Codable {
    case yonetici
}

// MARK: - OgImage
struct OgImage  :  Codable {
    let width, height: Int
    let url: String
    let type: OgImageType
}

enum OgImageType  : String, Codable {
    case imageJPEG
    case imagePNG
}

enum OgLocale  : String, Codable {
    case enUS
}

enum OgSiteName  : String, Codable {
    case hyperSuperReviews
}

enum OgType : String, Codable  {
    case article
}

// MARK: - Robots
struct Robots  :  Codable {
    let index: Index
    let follow: Follow
    let maxSnippet: MaxSnippet
    let maxImagePreview: MaxImagePreview
    let maxVideoPreview: MaxVideoPreview
}

enum Follow  : String, Codable {
    case follow
}

enum Index  : String, Codable {
    case index
}

enum MaxImagePreview  : String, Codable {
    case maxImagePreviewLarge
}

enum MaxSnippet  : String, Codable {
    case maxSnippet1
}

enum MaxVideoPreview  : String, Codable {
    case maxVideoPreview1
}

// MARK: - Schema
struct Schema  :Codable {
    let context: String
    let graph: [Graph]
}

// MARK: - Graph
struct Graph  :  Codable {
    let id: String
    let isPartOf: Breadcrumb?
    let author: GraphAuthor?
    let headline: String?
    let datePublished, dateModified: Date?
    let mainEntityOfPage: Breadcrumb?
    let wordCount: Int?
    let publisher: Breadcrumb?
    let articleSection: [ArticleSection]?
    let inLanguage: InLanguage?
    let url: String?
    let name, graphDescription: String?
    let breadcrumb: Breadcrumb?
    let potentialAction: [PotentialAction]?
    let itemListElement: [ItemListElement]?
    let image: Image?
    let logo: Breadcrumb?
    let sameAs: [String]?
    let keywords: [String]?
}

enum ArticleSection  : String, Codable {
    case film
}

// MARK: - GraphAuthor
struct GraphAuthor  :  Codable {
    let name: AuthorEnum
    let id: String
}

// MARK: - Breadcrumb
struct Breadcrumb  : Codable {
    let id: String
}

// MARK: - Image
struct Image  : Codable {
    let type: ImageType
    let inLanguage: InLanguage
    let id, url, contentURL: String
    let caption: AuthorEnum
}

enum InLanguage : String, Codable  {
    case enUS
}

enum ImageType  : String, Codable {
    case imageObject
}

// MARK: - ItemListElement
struct ItemListElement  :  Codable {
    let type: ItemListElementType
    let position: Int
    let name: String
    let item: String?
}

enum ItemListElementType  : String, Codable {
    case listItem
}

// MARK: - PotentialAction
struct PotentialAction  :  Codable {
    let type: PotentialActionType
    let queryInput: QueryInput?
}

enum QueryInput  : String, Codable {
    case requiredNameSearchTermString
}



// MARK: - TargetClass
struct TargetClass  :  Codable {
    let type: TargetType
    let urlTemplate: URLTemplate
}

enum TargetType : String, Codable  {
    case entryPoint
}

enum URLTemplate : String, Codable  {
    case httpWWWHypersuperprojectsCOMSSearchTermString
}

enum PotentialActionType : String, Codable  {
    case readAction
    case searchAction
}



enum TypeElement : String, Codable  {
    case organization
    case person
}

enum PurpleType  : String, Codable {
    case article
    case breadcrumbList
    case webPage
    case webSite
}

enum TwitterCard  : String, Codable {
    case summaryLargeImage
}

// MARK: - TwitterMisc
struct TwitterMisc : Codable{
    let writtenBy: AuthorEnum
    let estReadingTime: EstReadingTime
}

enum EstReadingTime : String, Codable {
    case the1Minute
    case the2Minutes
}



