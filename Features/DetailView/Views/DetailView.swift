//
//  DetailView.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 20.08.2024.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: ServerConstants.imageServerURL + (viewModel.movie?.backdropPath ?? "")), transaction: .init(animation: .bouncy(duration: 1))) { phase in
                    switch phase {
                    case .empty:
                        ZStack(content: {
                            ProgressView()
                                .tint(.white)
                        })
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .ignoresSafeArea()
                            .frame(height: 300)
                        
                    case .failure(let error):
                        EmptyView()
                    @unknown default:
                        ZStack(content: {
                            ProgressView()
                                .tint(.white)
                        })
                    }
                }
                .frame(height: 300)
                
                HStack(spacing: 50) {
                    VStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        let rating = String(format: "%.1f/10", viewModel.movie?.voteAverage ?? 0)
                        Text(rating)
                            .font(.font(.montserratRegular, size: 12))
                        
                        let voteCount = String(format: "%d", viewModel.movie?.voteCount ?? 0)
                        Text(voteCount)
                            .font(.font(.montserratRegular, size: 12))
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal, 20)
                    .padding(.leading, 20)

                    VStack {
                        Image(systemName: "star")
                            .foregroundColor(.black.opacity(0.8))
                        
                        Text("Rate This")
                            .font(.font(.montserratRegular, size: 12))
                    }
                    .padding(.horizontal, 20)
                    
                    VStack {
                        Image("imdb_logo", bundle: nil)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.trailing, 40)
                            .onTapGesture {
                                viewModel.openImdbLinkForMovie(with: viewModel.movie?.imdbId)
                            }
                    }
                }
                .frame(height: 80)
                .background(RoundedCorner(radius: 30, corners: [.topLeft, .bottomLeft])
                    .fill(.white)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/))
                .frame(maxWidth: .infinity)
                .padding(.top, -40)
                .padding(.leading, 70)
                
                VStack {
                    Text(viewModel.movie?.title ?? .empty)
                        .font(.font(.montserratSemiBold, size: 22))
                        .padding(.trailing, 10)
                    
                    HStack {
                        Text(viewModel.releaseYear)
                        
                        
                        
                    }

                }
                .padding(.top, 20)
            }
        }
        .ignoresSafeArea()
        .task {
           await viewModel.loadMovieDetails()
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(networkManager: NetworkManager(baseURL: ServerConstants.serverURL),
                                          movieId: 533535))
}
