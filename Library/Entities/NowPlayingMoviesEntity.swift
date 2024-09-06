//
//  NowPlayingMoviesEntity.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 30.01.2024.
//

import Foundation

struct NowPlayingMoviesEntity: Sendable {
    let dates: DatesEntity
    let page: Int?
    let movies: [MovieShortEntity]
    let totalPages: Int
    let totalResults: Int
}
