//
//  MovieReviewManager.swift
//  ZMovies
//
//  Created by Zin Lin Htet Naing on 16/03/2021.
//

import SwiftUI

final class  MovieReviewManager: ObservableObject {
    
    @Published var reviews = [Review]()
    
    private var movie: Movie
    
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func getMovieReviews() {
        
    }
    
    private func getRevies(for movie: Movie) {
        let urlString = "\(Self.baseURL)\(movie.id ?? 100)/reviews?api_key=\(API.key)"
        NetworkManager<ReviewResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let response):
                self.reviews = response.results
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
