//
//  Collection+Extensions.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

extension Collection where Element: EntitySerialization {
    
    func mapEntities() throws -> [Element.Entity] {
        try self.map { try $0.entity() }
    }
}
