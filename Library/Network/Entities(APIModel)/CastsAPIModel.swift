//
//  CastsAPIModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

struct CastsAPIModel: Codable {
    let id: Int
    let cast: [CastAPIModel]
}

extension CastsAPIModel: EntitySerialization {
    typealias Entity = CastsEntity
    
    func entity() throws -> CastsEntity {
        let cast = try cast.mapEntities()
        
        return CastsEntity(id: id,
                           cast: cast)
    }
}
