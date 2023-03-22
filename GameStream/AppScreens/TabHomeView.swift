//
//  TabHomeView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 22/03/23.
//

import SwiftUI

struct TabHomeView: View {
    var body: some View {
        ZStack {
            Color("Dark-Blue").ignoresSafeArea()
            
            VStack {
                Text("Home")
            }
            .padding(.horizontal, 30)
            
        }.toolbar(.hidden)
    }
}

struct TabHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabHomeView()
    }
}
