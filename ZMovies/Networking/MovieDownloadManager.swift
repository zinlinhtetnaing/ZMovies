//
//  MovieDownloadManager.swift
//  ZMovies
//
//  Created by Zin Lin Htet Naing on 16/03/2021.
//

import SwiftUI

final class MovieDownloadManager: ObservableObject {
    
    @Published var movies = [Movie]()
    @Published var cast = [Cast]()
    
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    
    func getNowPlaying() {
        getMovies(movieURL: .nowPlaying)
    }
    
    func getUpcoming() {
        getMovies(movieURL: .upcoming)
    }
    
    func getPopular() {
        getMovies(movieURL: .popular)
    }
    
    func getCast(for movie: Movie) {
        let urlString = "\(Self.baseURL)\(movie.id ?? 100)/credits?api_key=\(API.key)&language=en-US"
        NetworkManager<CastResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let response):
                self.cast = response.cast
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    private func getMovies(movieURL: MovieURL) {
        NetworkManager<MovieResponse>.fetch(from: movieURL.urlString) { (result) in
            switch result {
            case .success(let movieResponse):
                self.movies = movieResponse.results
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
}
