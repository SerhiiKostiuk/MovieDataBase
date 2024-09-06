//
//  CastAPIModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

struct CastAPIModel: Codable {
    let id: Int
    let adult: Bool
    let gender: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let castId: Int
    let character: String
    let creditId: String
    let order: Int
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id, name, popularity, character, order
        case knownForDepartment = "known_for_department"
        case originalName = "original_name"
        case profilePath = "profile_path"
        case castId = "cast_id"
        case creditId = "credit_id"
    }
}


extension CastAPIModel: EntitySerialization {
    typealias Entity = CastEntity
    
    func entity() throws -> CastEntity {
        CastEntity(id: id,
                   adult: adult,
                   gender: gender,
                   knownForDepartment: knownForDepartment,
                   name: name,
                   originalName: originalName,
                   popularity: popularity,
                   profilePath: profilePath,
                   castId: castId,
                   character: character,
                   creditId: creditId,
                   order: order)
    }
}
