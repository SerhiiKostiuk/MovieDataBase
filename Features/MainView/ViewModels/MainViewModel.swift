//
//  MainViewModel.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 26.01.2024.
//

import Foundation
import Combine
import Alamofire

@MainActor final class MainViewModel: ObservableObject {
    
    @Published private(set) var nowPlayingResults: [MovieShortEntity] = []
    @Published private(set) var genres: [GenreEntity] = []
    
    @Published var error: AFError?
    
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Properties
    // MARK: Private
    
    private let networkManager: NetworkManager
    private let router: Router
    // MARK: - Initialization
    
    init(networkManager: NetworkManager, router: Router) {
        self.networkManager = networkManager
        self.router = router
    }
    
    // MARK: - Methods
    // MARK: Public
    
    func showMovieDetails(with id: Int) {
        self.router.showMovieDetail(with: id)
    }
    
    func fetchNowPlayingMovies() async {
        do {
            let result = try await networkManager.request(MoviesRequests.moviesNowPlaying, NowPlayingMoviesAPIModel.self)
            
            self.nowPlayingResults = try result.movies.entities()
        } catch {
            self.error = error.asAFError
        }
    }
    
    func fetchGenres() {
        networkManager.request(MoviesRequests.moviesGenre, GenresAPIModel.self)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error
                }
            } receiveValue: { [weak self] genresResponse in
                self?.genres = (try? genresResponse.genres.entities()) ?? []
            }
            .store(in: &cancellables)
    }
}
