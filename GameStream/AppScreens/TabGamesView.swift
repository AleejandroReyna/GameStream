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
                    .font(.title)
                    .bold()
                    .padding(.top, 16)
                    .padding(.bottom, 64)
                
                ScrollView {
                    LazyVGrid(columns: gridShape, spacing: 8) {
                        ForEach(games.info, id: \.self) {
                            gameItem in
                            Button {
                                self.game = gameItem
                            } label: {
                                HStack {
                                    Text(gameItem.title!)
                                }
                            }

                        }
                    }
                }
                
            }.padding(.horizontal, 10)
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
