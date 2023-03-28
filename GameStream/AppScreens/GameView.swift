//
//  GameView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 27/03/23.
//

import SwiftUI

struct GameView: View {
    var game : GameParser
    
    var body: some View {
        ZStack {
            Color("Dark-Blue").ignoresSafeArea()
        }
    }
}

let testGame : GameParser = GameParser(title: "Sonic", studio: "Sega", contentRaiting: "E+", publicationYear: "1991", description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", platforms: ["PC"], tags: ["plataformas","mascota"], videosUrls: nil, galleryImages: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameView(game: testGame)
    }
}
