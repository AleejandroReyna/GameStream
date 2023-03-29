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
                    .padding(.bottom, 30)
                    
                    EditProfileForm()
                }
            }
        }
    }
}

struct EditProfileForm : View {
    @State var email : String = ""
    @State var password : String = ""
    @State var name : String = ""
    var userData = UserDataModel()
    
    var body : some View {
        VStack(alignment: .leading) {
            
            Text("Email")
                .foregroundColor(Color("Dark-Cyan"))
                .bold()
                
            TextField(
                text: $email,
                label: {
                    Text("text@example.com").foregroundColor(.gray)
                })
                .foregroundColor(.white)
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cyan"))
                .padding(.bottom)
            
            Text("Password")
            .foregroundColor(Color("Dark-Cyan"))
            .bold()
            
            SecureField(
                text: $password,
                label: {
                    Text("New Password").foregroundColor(.gray)
                })
                .foregroundColor(.white)
        
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cyan"))
                .padding(.bottom)
            
            Text("Name")
                .foregroundColor(Color("Dark-Cyan"))
                .bold()
                
            TextField(
                text: $name,
                label: {
                    Text("Your name here...").foregroundColor(.gray)
                })
                .foregroundColor(.white)
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cyan"))
                .padding(.bottom, 60)
            
            Button {
                updateData()
            } label: {
                Text("UPDATE")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 10, bottom: 11, trailing: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("Dark-Cyan"), lineWidth: 1)
                            .shadow(color: .white, radius: 6)
                    )
            }
            
        }.padding(.horizontal, 30)
    }
    
    func updateData() -> Void {
        let result = userData.saveData(email: email, password: password, name: name)
        print(result)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
