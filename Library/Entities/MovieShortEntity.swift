//
//  MovieEntity.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 30.01.2024.
//

import Foundation

struct MovieShortEntity: Sendable {
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
}
