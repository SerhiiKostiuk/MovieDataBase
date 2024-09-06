//
//  CollectionAPIModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

struct CollectionAPIModel: Codable {
    let id: Int
    let name: String
    let posterPath: String
    let backdropPath: String
    
    enum CodingKeys: String, CodingKey {
        case id,
             name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

extension CollectionAPIModel: EntitySerialization {
    typealias Entity = CollectionEntity
    
    func entity() throws -> CollectionEntity {
        CollectionEntity(id: id,
                         name: name,
                         posterPath: posterPath,
                         backdropPath: backdropPath)
    }
}
