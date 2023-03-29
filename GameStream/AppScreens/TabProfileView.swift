//
//  TabProfileView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 28/03/23.
//

import SwiftUI

struct TabProfileView: View {
    @State var username = "@aleejandroreyna"
    
    var body: some View {
        ZStack {
            Color("Dark-Blue").ignoresSafeArea()
            VStack {
                Text("Profile")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                VStack {
                    Image("Default-Avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                    
                    Text(username)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                }.padding(EdgeInsets(top: 30, leading: 0, bottom: 60, trailing: 0))
                
                SettingsModule()
            }
        }.onAppear() {
            print("exec get user info here")
        }
    }
}

struct SettingsModule : View {
    var body : some View {
        VStack(alignment: .leading) {
            
            Text("Settings")
                .foregroundColor(.white)
                .font(.title2)
                .bold()
                .padding(.horizontal, 10)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TabProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabProfileView()
    }
}
