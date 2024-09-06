//
//  ProductionCountryAPIModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

struct ProductionCountryAPIModel: Codable {
    let iso_3166_1: String
    let name: String
}

extension ProductionCountryAPIModel: EntitySerialization {
    typealias Entity = ProductionCountryEntity
    
    func entity() throws -> ProductionCountryEntity {
        ProductionCountryEntity(iso_3166_1: iso_3166_1,
                                name: name)
    }
}
