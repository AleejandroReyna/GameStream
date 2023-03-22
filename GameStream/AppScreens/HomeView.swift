//
//  HomeView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 21/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack {
            
            Color("Dark-Blue").ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 20)
                    .padding(.top, 10)
                
                TabView {
                    Text("Home")
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    Text("Profile")
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                    Text("Games")
                        .tabItem {
                            Image(systemName: "gamecontroller")
                            Text("Games")
                        }
                    
                    Text("Favorites")
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Favorites")
                        }
                }
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
