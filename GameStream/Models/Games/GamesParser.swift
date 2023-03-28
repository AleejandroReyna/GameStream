//
//  GameParser.swift
//  GameStream
//
//  Created by Alejandro Reyna on 27/03/23.
//

// MARK: - GameParser
struct GameParser: Codable {
    let title, studio, contentRaiting, publicationYear: String?
    let description: String?
    let platforms, tags: [String]?
    let videosUrls: VideosUrlsParser?
    let galleryImages: [String]?
}

// MARK: - VideosUrls
struct VideosUrlsParser: Codable {
    let mobile, tablet: String?
}

struct GamesParser : Codable {
    let games : [GamesParser]
}
