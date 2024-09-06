//
//  ProductionCompanyEntity.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

struct ProductionCompanyEntity: Sendable {
    let id: Int
    let logoPath: String?
    let name: String
    let originCountry: String
}
