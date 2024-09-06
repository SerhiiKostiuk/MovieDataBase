//
//  MoviesRequests.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 29.01.2024.
//

import Foundation
import Alamofire

enum MoviesRequests: BaseRequestProtocol {
    private typealias MoviesPaths = ServerConstants.MoviesPaths

    case moviesNowPlaying
    case moviesGenre
    case movieDetails(Int)
    case movieCasts(Int)
    
    // MARK: - Properties
    // MARK: Public
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .moviesNowPlaying:
            return MoviesPaths.movieNowPlaying
        case .moviesGenre:
            return MoviesPaths.moviesGenre
        case .movieDetails(let movieId):
            return MoviesPaths.movie + movieId.asString()
        case .movieCasts(let movieId):
            return MoviesPaths.movie + movieId.asString() + MoviesPaths.movieCasts
        }
    }
    
    var serverURL: String {
        return ServerConstants.serverURL + self.versionAPI
    }
    
    var versionAPI: String {
        return ServerConstants.APIVersion.v3
    }
    
}
