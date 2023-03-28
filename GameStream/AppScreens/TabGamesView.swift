//
//  TabGamesView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 27/03/23.
//

import SwiftUI

struct TabGamesView: View {
    var body: some View {
        Text("Games view")
            .onAppear() {
                print("first ")
                print("second")
            }
    }
}

struct TabGamesView_Previews: PreviewProvider {
    static var previews: some View {
        TabGamesView()
    }
}
