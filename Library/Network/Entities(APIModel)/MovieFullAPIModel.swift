//
//  MovieFullAPIModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

struct MovieFullAPIModel: Codable {
    let adult: Bool
    let backdropPath: String?
    let belongsToCollection: CollectionAPIModel
    let id: Int
    let budget: Int
    let genres: [GenreAPIModel]
    let homepage: String
    let imdbId: String
    let originCountry: [String]
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompanyAPIModel]
    let productionCountries: [ProductionCountryAPIModel]
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [SpokenLanguageAPIModel]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult,
             id,
             budget,
             genres,
             homepage,
             overview,
             popularity,
             revenue,
             runtime,
             status,
             tagline,
             title,
             video
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case imdbId = "imdb_id"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case spokenLanguages = "spoken_languages"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension MovieFullAPIModel: EntitySerialization {
    typealias Entity = MovieFullEntity
    
    func entity() throws -> MovieFullEntity {
        let collectionEntity = try belongsToCollection.entity()
        let genreEntities = try genres.mapEntities()
        let productionCompanies = try productionCompanies.mapEntities()
        let productionCountries = try productionCountries.mapEntities()
        let spokenLanguages = try spokenLanguages.mapEntities()
        
        return MovieFullEntity(adult: adult,
                               backdropPath: backdropPath,
                               belongsToCollection: collectionEntity,
                               id: id,
                               budget: budget,
                               genres: genreEntities,
                               homepage: homepage,
                               imdbId: imdbId,
                               originCountry: originCountry,
                               originalLanguage: originalLanguage,
                               originalTitle: originalTitle,
                               overview: overview,
                               popularity: popularity,
                               posterPath: posterPath,
                               productionCompanies: productionCompanies,
                               productionCountries: productionCountries,
                               releaseDate: releaseDate,
                               revenue: revenue,
                               runtime: runtime,
                               spokenLanguages: spokenLanguages,
                               status: status,
                               tagline: tagline,
                               title: title,
                               video: video,
                               voteAverage: voteAverage,
                               voteCount: voteCount)
    }
}
