//
//  GameView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 27/03/23.
//

import SwiftUI
import AVKit

struct GameView: View {
    var game : GameParser?
    
    var body: some View {
        ZStack {
            Color("Dark-Blue").ignoresSafeArea()
            if let detailGame = game {
                VStack {
                    DetailVideo(url: (detailGame.videosUrls?.mobile)!)
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                    ScrollView {
                        DetailInfo(game: detailGame)
                            .padding(.bottom)
                    }
                    .frame(maxWidth: .infinity)
                }
            } else {
                Text("Nothing to show")
            }
        }
    }
}

struct DetailVideo : View {
    var url : String
    
    var body : some View {
        if let videoURL = URL(string: url) {
            VideoPlayer(player: AVPlayer(url: videoURL))
                .ignoresSafeArea()
        }
    }
    
}

struct DetailInfo : View {
    var game : GameParser
    
    var body : some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(game.title!)
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
            
            HStack {
                Text(game.studio!)
                    .foregroundColor(.white)
                    .font(.subheadline)
                
                Text(game.contentRaiting!)
                    .foregroundColor(.white)
                    .font(.subheadline)
                
                Text(game.publicationYear!)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    
            }
            .padding(.top, 10)
            
            Text(game.description!)
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.vertical)

            HStack {
                ForEach(game.tags!, id: \.self) {
                    tag in
                        Text("#\(tag)")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            
                }
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
         .padding(.horizontal, 10)
    }
}

let testGame : GameParser = GameParser(title: "Sonic", studio: "Sega", contentRaiting: "E+", publicationYear: "1991", description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", platforms: ["PC"], tags: ["plataformas","mascota"], videosUrls: VideosUrlsParser(mobile: "https://dl.dropboxusercontent.com/s/k6g0zwmsxt9qery/TheWitcher480.mp4", tablet: "https://dl.dropboxusercontent.com/s/9faic5dtebavp1o/TheWitcherMax.mp4"), galleryImages: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameView(game: testGame)
    }
}
