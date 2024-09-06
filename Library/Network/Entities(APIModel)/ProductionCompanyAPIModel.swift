//
//  ProductionCompanyAPIModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

struct ProductionCompanyAPIModel: Codable {
    let id: Int
    let logoPath: String?
    let name: String
    let originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id,
             name
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

extension ProductionCompanyAPIModel: EntitySerialization {
    typealias Entity = ProductionCompanyEntity
    
    func entity() throws -> ProductionCompanyEntity {
        ProductionCompanyEntity(id: id,
                                logoPath: logoPath,
                                name: name,
                                originCountry: originCountry)
    }
}
