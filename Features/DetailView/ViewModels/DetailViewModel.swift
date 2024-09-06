//
//  DetailViewModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation
import UIKit

@MainActor final class DetailViewModel: ObservableObject {
    
    @Published private(set) var movie: MovieFullEntity?
    @Published private(set) var cast: CastsEntity?
    
    // MARK: - Properties
    // MARK: Private
    
    private let networkManager: NetworkManager
    private let movieId: Int
    
    // MARK: - Initialization
    
    init(networkManager: NetworkManager, movieId: Int) {
        self.networkManager = networkManager
        self.movieId = movieId
    }
    
    func loadMovieDetails() async {
        Task {
            let movie = try await networkManager.request(MoviesRequests.movieDetails(movieId), MovieFullAPIModel.self)
            self.movie = try movie.entity()
            
            let cast = try await networkManager.request(MoviesRequests.movieCasts(movieId), CastsAPIModel.self)
            self.cast = try cast.entity()
        }
    }
    
    func openImdbLinkForMovie(with id: String?) {
        guard let id, let url = URL(string: ServerConstants.ExtendedSources.imdbUrl + id) else { return }
        
        UIApplication.shared.open(url)
    }
    
    var releaseYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let releaseDate = movie?.releaseDate, let date = dateFormatter.date(from: releaseDate) {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            return year.asString()
        }
        
        return .empty
    }
    
    var movieDuration: String {
        guard let durationInMin = movie?.runtime else { return .empty }
        
        let hours = durationInMin / 60
        let minutes = durationInMin % 60
        
        return "\(hours) hours " + "\(minutes) minutes"
    }
}
