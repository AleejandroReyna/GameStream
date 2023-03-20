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
    
    // MARK: States
    @State var isLoginActive : Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("LOGIN") {
                    isLoginActive = true
                }
                .foregroundColor(isLoginActive ? .white : .gray)
                Spacer()
                Button("REGISTER") {
                    isLoginActive = false
                }
                .foregroundColor(isLoginActive ? .gray : .white)
                Spacer()
            }
            
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
    var body : some View {
        Text("Login")
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
