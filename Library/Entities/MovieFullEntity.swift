//
//  MovieFullEntity.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

struct MovieFullEntity: Sendable {
    let adult: Bool
    let backdropPath: String?
    let belongsToCollection: CollectionEntity
    let id: Int
    let budget: Int
    let genres: [GenreEntity]
    let homepage: String
    let imdbId: String
    let originCountry: [String]
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompanyEntity]
    let productionCountries: [ProductionCountryEntity]
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [SpokenLanguageEntity]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
