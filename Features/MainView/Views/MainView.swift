//
//  MainView.swift
//  MovieDataBase
//
//  Created by Serhii Kostiuk  on 26.01.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel(networkManager: NetworkManager(baseURL: ServerConstants.serverURL), router: .shared)
    @State private var selectedTabIndex = 0
    @State private var currentPage: Int = 0
    @State private var selectedTab: Int = 0
    @Namespace private var namespace

    private let tabs = ["In Theater", "Box Office", "Coming Soon", "Top Rated", "Trending"]
    
    var body: some View {
        TabView {
                ScrollView {
                    VStack {
                        LazyVStack {
    //                        self.nowPlayingBanner
    //                        PageControl(numberOfPages: $viewModel.nowPlayingResults.count, currentPage: $currentPage)
    //                            .frame(width: CGFloat(viewModel.nowPlayingResults.count * 18))
    //                            .padding(.trailing)
                        }
                        moviesLists
                        self.genresView
                        
    //                    VStack {
                            moviesCardsView
    //                    }

                    }
                   
                    .frame(maxHeight: .infinity)
    //                .background(.orange)
    //                .frame(height: 600)
                }
                .frame(maxHeight: .infinity)
                .tabItem {
                    Image(systemName: "1.circle.fill")
                    Text("Tab 1")
                }
                
                // Tab 2
                Text("Tab 2 Content")
                    .tabItem {
                        Image(systemName: "2.circle.fill")
                        Text("Tab 2")
                    }
                
                // Add more tabs as needed
            }
    }
    
    func getScale(for index: Int) -> CGFloat {
        let selectedIndex = CGFloat(selectedTabIndex)
        let distance = abs(selectedIndex - CGFloat(index))
        return max(1.0 - (distance * 0.2), 0.8) // Adjust the scaling factor as needed
    }
    
    private var nowPlayingBanner: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.nowPlayingResults, id: \.id) { movie in
                        AsyncImage(url: URL(string: ServerConstants.imageServerURL + (movie.backdropPath ?? "")), transaction: .init(animation: .bouncy(duration: 1))) { phase in
                            switch phase {
                            case .empty:
                                ZStack(content: {
                                    ProgressView()
                                        .tint(.white)
                                })
                                .frame(width: geometry.size.width)
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                            case .failure(let error):
                                Text(error.localizedDescription)
                            @unknown default:
                                ZStack(content: {
                                    ProgressView()
                                        .tint(.white)
                                })
                                .frame(width: geometry.size.width)
                            }
                        }
                        .frame(width: geometry.size.width - 40)
                        .clipShape(.rect(cornerRadius: 6))
                    }//39.50152
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, 20)
        }
        .task {
            await viewModel.fetchNowPlayingMovies()
        }
        .frame(height: 300)
    }
    
    private var moviesLists: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20, content: {
                ForEach(tabs.indices, id: \.self) { index in
                    VStack {
                        Text(tabs[index])
                            .font(.headline)
                            .foregroundStyle(selectedTab == index ? .black : .gray)
                            .padding(.bottom, 2)
                        
                        if selectedTab == index {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(.red)
                                .matchedGeometryEffect(id: "underline", in: namespace)
                                .padding(.horizontal, 10)
                        } else {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(.clear)
                                .padding(.horizontal, 10)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedTab = index
                        }
                    }
                }
            })
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)

    }
    
    private var genresView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            LazyHGrid(rows: [GridItem(.flexible(minimum: 0, maximum: CGFloat(viewModel.genres.count)))],
                      spacing: 20) {
                ForEach(viewModel.genres, id: \.id) { genre in
                    Button(action: {
//                        toggleSelection(for: element)
                    }) {
                        Text("\(genre.name)")
                            .font(.font(.montserratExtraLight, size: 13))
                            .foregroundColor(.black)
                            .padding(8)
                            .padding(.horizontal, 6)
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(.gray, lineWidth: 1)
                            }
                    }
                }
            }
                      .frame(height: 44)

            .onAppear {
                viewModel.fetchGenres()
            }
            .padding(.horizontal, 20)
        }
        .padding(.top, 20)
    }
    
    private var moviesCardsView: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(viewModel.nowPlayingResults, id: \.id) { movie in
                        Button {
                            viewModel.showMovieDetails(with: movie.id)
                        } label: {
                            MovieCardView(movieEntity: movie)
                        }
                        .tint(.black)
//                        .buttonStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Button Style@*/DefaultButtonStyle()/*@END_MENU_TOKEN@*/)
                    }
                }
                .scrollTargetLayout()
                .safeAreaPadding(.horizontal, geometry.size.width / 4)
            }
            .scrollClipDisabled()
            .scrollTargetBehavior(.viewAligned)
        }
        .frame(minHeight: 600)
        .task {
            await viewModel.fetchNowPlayingMovies()
        }
    }
    
    
}

struct MovieCardView: View {
    let movieEntity: MovieShortEntity
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: ServerConstants.imageServerURL + (movieEntity.backdropPath ?? "")), transaction: .init(animation: .bouncy(duration: 1))) { phase in
                Group {
                    switch phase {
                    case .empty:
                        ZStack(content: {
                            ProgressView()
                                .tint(.white)
                        })
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 240, height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .padding(.horizontal, 20)
                            .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive, axis: .horizontal) { effect, phase in
                                    
                                effect
                                    .scaleEffect(1 - abs(0.1))
                                    .opacity(1 - abs(phase.value))
                                    .rotation3DEffect(.degrees(phase.value * 8), axis: (x: 0, y: 0, z: 0.1))
                            }
                    case .failure(let error):
                        Text(error.localizedDescription)
                    @unknown default:
                        ZStack(content: {
                            ProgressView()
                                .tint(.white)
                        })
                    }
                }
                .frame(width: 240, height: 400)
            }
            
            VStack {
                Text(movieEntity.originalTitle)
                    .font(.font(.montserratSemiBold, size: 16))
                    .frame(maxWidth: 200, alignment: .center)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2)
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    let rating = String(format: "%.1f", movieEntity.voteAverage)
                    Text(rating)
                        .font(.font(.montserratRegular, size: 12))
                }
            }
            .padding(.top, 20)
        }
        .padding(.top, 40)
    }
}

#Preview {
    MainView()
}

struct PageControl: UIViewRepresentable {
    @Binding var numberOfPages: Int
    @Binding var currentPage: Int

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        
        return control
    }
    
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}
