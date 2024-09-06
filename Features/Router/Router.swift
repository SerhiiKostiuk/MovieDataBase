//
//  Router.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 21.08.2024.
//

import Foundation

final class Router: ObservableObject {
    static let shared = Router()
    
    @Published var path = [Route]()
    
    func showMovieDetail(with id: Int) {
        path.append(.movieDetail(id))
    }
    
    func back() {
        path.removeLast()
    }
}
