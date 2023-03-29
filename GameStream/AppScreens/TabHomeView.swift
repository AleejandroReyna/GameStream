//
//  TabHomeView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 22/03/23.
//

import SwiftUI
import AVKit

struct TabHomeView: View {
    
    var body: some View {
        ZStack {
            Color("Dark-Blue").ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 5)
                    .padding(.top, 10)
                
                ScrollView {
                    PopularSubModule()
                    CategoriesSubModule()
                    RecommendedSubModule()
                    MightLikeSubModule()
                }
            }
            .padding(.horizontal, 10)
            
        }.toolbar(.hidden)
    }
}

struct PopularSubModule:View {
    
    @State var searchText = ""
    @State var isInfoEmpty : Bool = false
    @State var isGameViewActive = false
    @State var isPlayerActive = false
    @State var activeGame : GameParser? = nil
    
    @ObservedObject var searchResults = SearchModel()
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"

    var body : some View {
        VStack {
            
            HStack {
                Button {
                    search(name: searchText)
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(searchText.isEmpty ? .yellow : Color("Dark-Cyan"))
                }
                .alert(isPresented: $isInfoEmpty) {
                    Alert(title: Text("Error"), message: Text("Game not found"), dismissButton: .default(Text("Close")))
                }
                
                TextField(
                    text: $searchText,
                    label: {
                        Text("Search a video").foregroundColor(Color("Text-Gray"))
                    })
                    .foregroundColor(.white)

            }
            .padding([.top, .leading, .bottom], 11)
            .background(Color("Light-Blue"))
            .clipShape(Capsule())

            
            Text("MOST POPULAR")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            Button {
                isPlayerActive = true
            } label: {
                ZStack {

                    VStack(spacing: 0) {
                        Image("Default-Featured-Image").resizable().scaledToFill()
                        Text("The Witcher")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .bold()
                            .font(.title3)
                            .background(Color("Light-Blue"))
                    }
                    
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 42, height: 42)
                    
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                 .padding(.vertical)
            }
        }
        
        NavigationLink(value: "gameDetail") {
            EmptyView()
        }
        .navigationDestination(isPresented: $isGameViewActive) {
            GameView(game: activeGame)
        }

    }
    
    func search(name: String) -> Void {
        searchResults.requestData(search: name) { finished in
            if finished {
                DispatchQueue.main.async {
                    
                    if searchResults.info.count == 0 {
                        isInfoEmpty = true
                    } else {
                        activeGame = searchResults.info.first
                        isGameViewActive = true
                    }
                }
            }
        }
    }
}

struct CategoriesSubModule : View {
    var body : some View {
        Text("SUGGESTED CATEGORIES")
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                Button {
                    print("category")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("Light-Blue"))
                            .frame(width: 160, height: 90)
                        
                        Image("game")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    }
                }
                
                Button {
                    print("category")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("Light-Blue"))
                            .frame(width: 160, height: 90)
                        
                        Image("shooter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    }
                }
                
                Button {
                    print("category")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("Light-Blue"))
                            .frame(width: 160, height: 90)
                        
                        Image("rpg")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    }
                }
                
                Button {
                    print("category")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("Light-Blue"))
                            .frame(width: 160, height: 90)
                        
                        Image("world")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    }
                }
            }
        }
    }
}

struct RecommendedSubModule : View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    
    var body : some View {
        Text("RECOMMENDED FOR YOU")
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    isPlayerActive = true
                } label: {
                    Image("Default-Featured-Image").resizable().scaledToFit()
                        .frame(width: 240, height: 135)
                }
                
                Button {
                    isPlayerActive = true
                } label: {
                    Image("Default-Featured-Image").resizable().scaledToFit()
                        .frame(width: 240, height: 135)
                }
                
                Button {
                    isPlayerActive = true
                } label: {
                    Image("Default-Featured-Image").resizable().scaledToFit()
                        .frame(width: 240, height: 135)
                }

            }
        }
        
        NavigationLink(value: "showVideo") {
            EmptyView()
        }
        .navigationDestination(isPresented: $isPlayerActive) {
            VideoPlayer(player: AVPlayer(url: URL(string: url)!))
                .frame(width: 400, height: 300)
        }
    }
}

struct MightLikeSubModule : View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    
    var body : some View {
        Text("YOU MIGHT LIKE")
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    isPlayerActive = true
                } label: {
                    Image("Default-Featured-Image").resizable().scaledToFit()
                        .frame(width: 240, height: 135)
                }
                
                Button {
                    isPlayerActive = true
                } label: {
                    Image("Default-Featured-Image").resizable().scaledToFit()
                        .frame(width: 240, height: 135)
                }
                
                Button {
                    isPlayerActive = true
                } label: {
                    Image("Default-Featured-Image").resizable().scaledToFit()
                        .frame(width: 240, height: 135)
                }

            }
        }
        
        NavigationLink(value: "showVideo") {
            EmptyView()
        }
        .navigationDestination(isPresented: $isPlayerActive) {
            VideoPlayer(player: AVPlayer(url: URL(string: url)!))
                .frame(width: 400, height: 300)
        }
    }
}

struct TabHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabHomeView()
    }
}
