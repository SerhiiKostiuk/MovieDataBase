//
//  NowPlayingMoviesAPIModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 26.01.2024.
//

import Foundation

struct NowPlayingMoviesAPIModel: Codable {
    let dates: DatesAPIModel
    let page: Int?
    let movies: [MovieShortAPIModel]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case dates,
             page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension NowPlayingMoviesAPIModel: EntitySerialization {
    typealias Entity = NowPlayingMoviesEntity
    
    
    func entity() throws -> NowPlayingMoviesEntity {
        let datesEntity = try dates.entity()
        let movieEntities = try movies.mapEntities()
        
        return NowPlayingMoviesEntity(dates: datesEntity,
                                      page: page,
                                      movies: movieEntities,
                                      totalPages: totalPages,
                                      totalResults: totalResults)
    }
}

struct DatesAPIModel: Codable, EntitySerialization {
    typealias Entity = DatesEntity

    let maximum: String
    let minimum: String
    
    func entity() throws -> DatesEntity {
        return DatesEntity(maximum: maximum,
                           minimum: minimum)
    }
}
