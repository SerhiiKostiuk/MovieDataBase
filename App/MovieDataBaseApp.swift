//
//  MovieDataBaseApp.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 26.01.2024.
//

import SwiftUI

@main
struct MovieDataBaseApp: App {
    @ObservedObject var router = Router.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                MainView()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .movieDetail(let id):
                            DetailView(viewModel: .init(networkManager: .init(baseURL: ServerConstants.serverURL),
                                                        movieId: id))
                            .toolbarRole(.editor)

                        }
                    }
            }
            .tint(.black)
        }
    }
}
