//
//  ContentView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 19/03/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Default Render
    var body: some View {
        ZStack {
            
            Color(UIColor(red: 19 / 255, green: 30 / 255, blue: 53 / 255, alpha: 1)).ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                
                LoginAndRegisterView()
            }
        }
    }
}

struct LoginAndRegisterView : View {
    
    var body: some View {
        VStack {
            HStack {
                Text("LOGIN")
                Text("REGISTER")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
