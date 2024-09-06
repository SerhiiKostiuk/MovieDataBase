//
//  GenreAPIModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 31.01.2024.
//

import Foundation

struct GenresAPIModel: Codable {
    let genres: [GenreAPIModel]
}

struct GenreAPIModel: Codable {
    let id: Int
    let name: String
}

extension GenreAPIModel: EntitySerialization {
    typealias Entity = GenreEntity
    
    func entity() throws -> GenreEntity {
        GenreEntity(id: id,
                    name: name)
    }
}
