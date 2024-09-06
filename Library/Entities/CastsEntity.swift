//
//  CastsEntity.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

struct CastsEntity: Sendable {
    let id: Int
    let cast: [CastEntity]
}
