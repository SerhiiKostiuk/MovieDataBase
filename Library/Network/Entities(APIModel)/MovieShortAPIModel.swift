//
//  MovieAPIModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 26.01.2024.
//

import Foundation

struct MovieShortAPIModel: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult,
             id, 
             overview,
             popularity,
             title,
             video
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension MovieShortAPIModel: EntitySerialization {
    typealias Entity = MovieShortEntity
    
    func entity() throws -> MovieShortEntity {
        return MovieShortEntity(adult: adult,
                                backdropPath: backdropPath,
                                genreIds: genreIds,
                                id: id,
                                originalLanguage: originalLanguage,
                                originalTitle: originalTitle,
                                overview: overview,
                                popularity: popularity,
                                posterPath: posterPath,
                                releaseDate: releaseDate,
                                title: title,
                                video: video,
                                voteAverage: voteAverage,
                                voteCount: voteCount)
    }
}
