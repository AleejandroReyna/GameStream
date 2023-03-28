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
                            .padding(.bottom, 30)
                        
                        DetailGallery(game: detailGame)
                            .padding(.bottom, 30)
                        
                        DetailComments()
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

struct DetailGallery : View {
    var game : GameParser
    
    var body : some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .padding(.horizontal, 10)
                .foregroundColor(.white)
                .font(.title2)
                .bold()
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridShape, spacing: 8) {
                    ForEach(game.galleryImages!, id: \.self) { url in
                        AsyncImage(url: URL(string: url)) { Image in
                            Image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            EmptyView()
                        }
                    }
                }
            }.frame(height: 180)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct DetailComments : View {
    var body : some View {
        VStack(alignment: .leading) {
            Text("Comments")
                .foregroundColor(.white)
                .font(.title2)
                .bold()
            
            Comment(username: "Geoff Atto", date: "2 days ago", comment: "He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
            
        }.frame(maxWidth: .infinity, alignment: .leading)
         .padding(.horizontal, 10)
    }
}

let gridShape = [
    GridItem(.flexible())
]

struct Comment : View {
    var username : String
    var date : String
    var comment : String
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("Light-Blue"))
            
            VStack(alignment: .leading) {
                HStack {
                    Image("Default-Avatar")
                        .padding(.trailing, 5)
                    VStack(alignment: .leading) {
                        Text(username)
                            .foregroundColor(.white)
                            .bold()
                        Text(date)
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                }
                .padding(.bottom, 5)
                Text(comment)
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            
        }.frame(maxWidth: .infinity)
    }
}

let testGame : GameParser = GameParser(title: "Sonic", studio: "Sega", contentRaiting: "E+", publicationYear: "1991", description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", platforms: ["PC"], tags: ["plataformas","mascota"], videosUrls: VideosUrlsParser(mobile: "https://dl.dropboxusercontent.com/s/k6g0zwmsxt9qery/TheWitcher480.mp4", tablet: "https://dl.dropboxusercontent.com/s/9faic5dtebavp1o/TheWitcherMax.mp4"),
   galleryImages: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_107600c1337accc09104f7a8aa7f275f23cad096.600x338.jpg",
       "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_ed23139c916fdb9f6dd23b2a6a01d0fbd2dd1a4f.600x338.jpg",
       "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_908485cbb1401b1ebf42e3d21a860ddc53517b08.600x338.jpg"])

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameView(game: testGame)
    }
}
