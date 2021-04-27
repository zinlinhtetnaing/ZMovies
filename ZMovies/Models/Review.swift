//
//  Review.swift
//  ZMovies
//
//  Created by Zin Lin Htet Naing on 16/03/2021.
//

import Foundation

struct ReviewResponse: Codable {
    var results: [Review]
}

struct Review: Codable, Identifiable {
    var id: String?
    var author: String?
    var content: String?
}
