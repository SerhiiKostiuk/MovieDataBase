//
//  ServerConstants.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 26.01.2024.
//

import Foundation

enum ServerConstants {
    static var serverURL: String {
        return "https://api.themoviedb.org"
    }
    
    static var imageServerURL: String {
        return "https://image.tmdb.org/t/p/original"
    }
    
    enum APIVersion {
        static let v3 = "/3"
    }
    
    enum HTTPHeaderField {
        static let contentType = "accept"
        static let authorization = "Authorization"
    }
    
    enum HTTPHeaderValues {
        static let json = "application/json"
        static let token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTljZTU5MzQ0NTA3OGE2MmZhZjFlYWU5MDM5NTQ2YSIsInN1YiI6IjU4NjEyYjhiYzNhMzY4MWE3NzAyZTE5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6ABi6bRtNy9QR2Yqxj3Uw7d2A9TTqGmmNmpil-xn6so"
    }
    
    enum APIParameterKey {
       
    }
    
    enum MoviesPaths {
        static let movie = "/movie/"
        static let moviesGenre = "/genre/movie/list"
        static let movieNowPlaying = "/movie/now_playing"
        static let movieCasts = "/credits"
    }
    
    enum TVsPaths {
        static let tvsGenre = "/genre/tv/list"
        static let tvOnTheAir = "/tv/on_the_air"
    }
    
    enum ExtendedSources {
        static let imdbUrl = "https://www.imdb.com/title/"
    }
}
