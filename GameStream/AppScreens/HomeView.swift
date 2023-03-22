//
//  HomeView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 21/03/23.
//

import SwiftUI

struct HomeView: View {
    // MARK: States
    @State var selectedTab : String = "home"
    
    // MARK: Body
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
                
                TabView(selection: $selectedTab) {
                    Text("Profile")
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag("profile")
                    
                    Text("Games")
                        .tabItem {
                            Image(systemName: "gamecontroller")
                            Text("Games")
                        }
                        .tag("games")
                    
                    TabHomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                        .tag("home")
                    
                    Text("Favorites")
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Favorites")
                        }
                        .tag("favorites")
                }
            }
        }
    }
    
    // MARK: Initializer
    init() {
        UITabBar
            .appearance()
            .backgroundColor = UIColor(Color("TabBar-Background"))
        UITabBar
            .appearance()
            .isTranslucent = true
        UITabBar
            .appearance()
            .unselectedItemTintColor = UIColor(Color(.gray))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
