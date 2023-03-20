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
                .padding(.bottom, 20)
                .padding(.top, 10)
                
                LoginAndRegisterView()
            }
        }
    }
}

struct LoginAndRegisterView : View {
    
    // MARK: States
    @State var isLoginActive : Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Button("LOGIN") {
                    isLoginActive = true
                }
                .foregroundColor(isLoginActive ? .white : .gray)
                Spacer()
                Button("REGISTER") {
                    isLoginActive = false
                }
                .foregroundColor(isLoginActive ? .gray : .white)
            }
            .padding(.horizontal, 30)
            
            Spacer(minLength: 42)
            
            if isLoginActive {
                LoginView()
            } else {
                RegisterView()
            }
        }
    }
}

struct LoginView : View {
    @State var email : String = ""
    @State var password : String = ""
    
    var body : some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Email")
                .foregroundColor(Color("Dark-Cyan"))
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
                
                SecureField(
                    text: $password,
                    label: {
                        Text("Password here...").foregroundColor(.gray)
                    })
                    .foregroundColor(.white)
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan"))
                    .padding(.bottom)
                
            }.padding(.horizontal, 30)
        }
    }
}

struct RegisterView : View {
    var body : some View {
        Text("Register")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
