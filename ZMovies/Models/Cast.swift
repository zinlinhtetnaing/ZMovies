//
//  Cast.swift
//  ZMovies
//
//  Created by Zin Lin Htet Naing on 16/03/2021.
//

import Foundation

struct CastResponse: Codable {
    var cast: [Cast]
}

struct Cast: Codable, Identifiable {
    var id: Int?
    var name: String?
    var character: String?
    var profile_path: String?
    var profilePhoto: String {
        guard let path = profile_path else { return "https://picsum.photos/200/300" }
        return "https://image.tmdb.org/t/p/original/\(path)"
    }
}
