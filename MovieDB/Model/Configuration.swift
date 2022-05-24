//
//  Configuration.swift
//  MovieDB
//
//  Created by Mingyong Zhu on 5/23/22.
//

import Foundation

struct Configuration: Codable {
    let images: Images
    let changeKeys: [String]

    enum CodingKeys: String, CodingKey {
        case images = "images"
        case changeKeys = "change_keys"
    }
}

struct Images: Codable {
    let baseURL: String
    let secureBase: String
    let backdropSizes: [String]
    let logoSizes: [String]
    let posterSizes: [String]
    let profileSizes: [String]
    let stillSizes: [String]

    enum CodingKeys: String, CodingKey {
        case baseURL = "base_url"
        case secureBase = "secure_base"
        case backdropSizes = "backdrop_sizes"
        case logoSizes = "logo_sizes"
        case posterSizes = "poster_sizes"
        case profileSizes = "profile_sizes"
        case stillSizes = "still_sizes"
    }
}
