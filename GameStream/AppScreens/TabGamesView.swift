//
//  TabGamesView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 27/03/23.
//

import SwiftUI

struct TabGamesView: View {
    
    @ObservedObject var games = GamesModel()
    @State var isGameViewActive : Bool = false
    @State var game : GameParser? = nil
    
    var body: some View {
        ZStack {
            Color("Dark-Blue").ignoresSafeArea()
            VStack {
                Text("Games")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 16)
                    .padding(.bottom, 64)
                
                ScrollView {
                    LazyVGrid(columns: gridShape, spacing: 8) {
                        ForEach(games.info, id: \.self) {
                            gameItem in
                            Button {
                                self.game = gameItem
                                self.isGameViewActive = true
                            } label: {
                                if let imageUrl = gameItem.galleryImages![0] {
                                    AsyncImage(url: URL(string: imageUrl)) { Image in
                                        Image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle.init(cornerRadius: 4))
                                    } placeholder: {
                                        Text(gameItem.title!)
                                    }
                                } else {
                                    Text(gameItem.title!)
                                }
                            }

                        }
                    }
                }
                
            }.padding(.horizontal, 10)

            NavigationLink(value: "gameDetail") {
                EmptyView()
            }
            .navigationDestination(isPresented: $isGameViewActive) {
                GameView(game: self.game)
            }
        }
        .onAppear() {
            if !games.info.isEmpty {
                print(games.info[0].title!)
            }
        }
    }
    
    let gridShape  = [
        GridItem(.flexible()), GridItem(.flexible())
    ]
}

struct TabGamesView_Previews: PreviewProvider {
    static var previews: some View {
        TabGamesView()
    }
}
