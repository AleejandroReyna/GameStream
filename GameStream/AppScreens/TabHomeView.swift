//
//  TabHomeView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 22/03/23.
//

import SwiftUI
import AVKit

struct TabHomeView: View {
    @State var searchText = ""
    
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
                
                HStack {
                    Button {
                        search()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchText.isEmpty ? .yellow : Color("Dark-Cyan"))
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
                
                ScrollView {
                    PopularSubModule()
                    CategoriesSubModule()
                }
            }
            .padding(.horizontal, 10)
            
        }.toolbar(.hidden)
    }
    
    func search() -> Void {
        print("User is looking for \(searchText)")
    }
}

struct PopularSubModule:View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body : some View {
        VStack {
            Text("MOST POPULAR")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            Button {
                print(url)
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
        
        NavigationLink(value: "showVideo") {
            EmptyView()
        }
        .navigationDestination(isPresented: $isPlayerActive) {
            VideoPlayer(player: AVPlayer(url: URL(string: url)!))
                .frame(width: 400, height: 300)
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

struct TabHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabHomeView()
    }
}
