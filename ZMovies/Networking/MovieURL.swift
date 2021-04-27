//
//  MovieURL.swift
//  ZMovies
//
//  Created by Zin Lin Htet Naing on 16/03/2021.
//

import Foundation

enum MovieURL: String {
    case nowPlaying = "now_playing"
    case upcoming = "upcoming"
    case popular = "popular"
    
    var urlString: String {
        "\(MovieDownloadManager.baseURL)\(self.rawValue)?api_key=\(API.key)&language=en-US&page=1"
    }
}
