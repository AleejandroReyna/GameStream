//
//  FavoritesView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 28/03/23.
//

import SwiftUI
import AVKit

struct TabFavoritesView: View {
    
    @ObservedObject var games = GamesModel()
    
    var body: some View {
        ZStack {
            Color("Dark-Blue").ignoresSafeArea()
            
            VStack {
                Text("Favorites")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 9)
                
                ScrollView {
                    ForEach(games.info, id: \.self) {
                        game in
                        VStack(spacing: 0) {
                            if let videoURL = game.videosUrls?.mobile {
                                if let url = URL(string: videoURL) {
                                    VideoPlayer(player: AVPlayer(url: url))
                                        .frame(height: 300)
                                }
                            }
                            if let title = game.title {
                                Text(title)
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color("Light-Blue"))
                                    .clipShape(RoundedRectangle(cornerRadius: 3))
                                    
                            }
                        }
                        .padding(.bottom, 5)
                    }
                }.padding(.bottom, 8)
                
            }.padding(.horizontal, 10)
        }.navigationBarBackButtonHidden()
    }
}

struct TabFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        TabFavoritesView()
    }
}
