//
//  SpokenLanguageAPIModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

struct SpokenLanguageAPIModel: Codable {
    
    let englishName: String
    let iso_639_1: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso_639_1, name
    }
}

extension SpokenLanguageAPIModel: EntitySerialization {
    typealias Entity = SpokenLanguageEntity
    
    func entity() throws -> SpokenLanguageEntity {
        SpokenLanguageEntity(englishName: englishName,
                             iso_639_1: iso_639_1,
                             name: name)
    }
}
