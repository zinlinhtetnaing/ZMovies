//
//  Movie.swift
//  ZMovies
//
//  Created by Zin Lin Htet Naing on 16/03/2021.
//

import Foundation

struct MovieResponse: Codable {
    var results: [Movie]
}

struct Movie: Codable, Identifiable {
    var id: Int?
    var title: String?
    var original_language: String?
    var overview: String?
    var poster_path: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_average: Double?
    var vote_count: Int?
    var video: Bool?
    var adult: Bool?
    var release_date: String?
    var posterPath: String {
        guard let path = poster_path else { return "" }
        return "https://image.tmdb.org/t/p/original/\(path)"
    }
    var voteAverage: Double {
        guard let avg = vote_average else { return 0.0 }
        return avg / 10.0
    }
    var titleWithLanguage: String {
        guard let title = title, let lang = original_language else { return "" }
        return "\(title)(\(lang)"
    }
}
