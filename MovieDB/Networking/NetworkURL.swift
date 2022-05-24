//
//  NetworkURL.swift
//  MovieDB
//
//  Created by Mingyong Zhu on 5/23/22.
//

import Foundation

enum NetworkURL {
    static let BaseURL = "https://api.themoviedb.org/3/"
    
    static let ImageBaseURL = "https://image.tmdb.org/t/p/"
    
    static let APIKey = "142d48e7dd566de20e630c3104b37096"
}

enum QueryCategory {
    static let configuration = "configuration"
    static let trending = "trending"
    static let movie = "movies"
    static let company = "companies"
}
