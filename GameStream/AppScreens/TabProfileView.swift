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
                Spacer()
            }
            
        }.onAppear() {
            print("exec get user info here")
        }
    }
}

struct SettingsModule : View {
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    var body : some View {
        VStack(alignment: .leading) {
            
            Text("Settings")
                .foregroundColor(.white)
                .font(.title2)
                .bold()
                .padding(.horizontal, 10)
                .padding(.bottom, 20)
            
            Button {
                //
            } label: {
                HStack {
                    Text("Account")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                }.padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(Color("Light-Blue"))
            }
            
            Button {
                //
            } label: {
                HStack {
                    Text("Notifications")
                        .foregroundColor(.white)
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                }.padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(Color("Light-Blue"))
            }
            
            Button {
                isEditProfileViewActive = true
            } label: {
                HStack {
                    Text("Edit Profile")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                }.padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(Color("Light-Blue"))
            }
            
            Button {
                //
            } label: {
                HStack {
                    Text("Rate This App")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                }.padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(Color("Light-Blue"))
            }

            
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 10)
        
        NavigationLink(value: "editProfile") {
            EmptyView()
        }
        .navigationDestination(isPresented: $isEditProfileViewActive) {
            EditProfileView()
        }
    }
}

struct TabProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabProfileView()
    }
}
