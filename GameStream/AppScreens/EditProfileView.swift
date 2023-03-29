//
//  EditProfileView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 29/03/23.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            Color("Dark-Blue").ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Button {
                        // action
                    } label: {
                        ZStack {
                            Image("Default-Avatar")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 88, height: 88)
                                .clipShape(Circle())
                            
                            Image(systemName: "camera")
                            
                        }
                    }
                }
                
                EditProfileForm()
            }
        }
    }
}

struct EditProfileForm : View {
    var body : some View {
        Text("Edit")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
