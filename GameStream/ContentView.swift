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
                
                Text("Password")
                .foregroundColor(Color("Dark-Cyan"))
                
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
                
                HStack{
                    Spacer()
                    Button("Forgot your password?") {
                    }
                    .foregroundColor(Color("Dark-Cyan"))
                }.padding(.bottom)
                
                Button {
                    print("I'm loging")
                } label: {
                    Text("LOGIN")
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
                .padding(.bottom, 60)
                
                Text("Login with social media accounts")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 20)
                
                HStack {
                    Button {
                        print("Login with Facebook")
                    } label: {
                        Text("Facebook")
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                            .foregroundColor(.white)
                            .background(Color("Light-Blue"))
                            .cornerRadius(6)
                    }
                    
                    Button {
                        print("Login with Twitter")
                    } label: {
                        Text("Twitter")
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                            .foregroundColor(.white)
                            .background(Color("Light-Blue"))
                            .cornerRadius(6)
                    }
                }

                
            }.padding(.horizontal, 30)
                .frame(width: .infinity)
        }
    }
}

struct RegisterView : View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var passwordConfirmation : String = ""
    
    var body : some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                VStack(alignment: .center) {
                    Text("Choose a profile photo")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("You can change or choose another picture later")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .fontWeight(.light)
                        .padding(.bottom)
                    
                    Button(action: takePhoto) {
                        
                        ZStack {
                            Image("Default-Avatar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                                
                        }
                    }
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity)
                
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
                    
                    Text("Password")
                    .foregroundColor(Color("Dark-Cyan"))
                    
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
                    
                    Text("Confirm Password")
                    .foregroundColor(Color("Dark-Cyan"))
                    
                    SecureField(
                        text: $passwordConfirmation,
                        label: {
                            Text("Password Confirmation").foregroundColor(.gray)
                        })
                        .foregroundColor(.white)
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("Dark-Cyan"))
                        .padding(.bottom)
                }
                
                Button {
                    print("I'm registering")
                } label: {
                    Text("REGISTER")
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
                .padding(.bottom, 60)
                
                Text("Or register with social media accounts")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 20)
                
                HStack {
                    Button {
                        print("Login with Facebook")
                    } label: {
                        Text("Facebook")
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                            .foregroundColor(.white)
                            .background(Color("Light-Blue"))
                            .cornerRadius(6)
                    }
                    
                    Button {
                        print("Login with Twitter")
                    } label: {
                        Text("Twitter")
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                            .foregroundColor(.white)
                            .background(Color("Light-Blue"))
                            .cornerRadius(6)
                    }
                }

                
            }.padding(.horizontal, 30)
                .frame(width: .infinity)
        }
    }
}

func takePhoto() {
    print("take photo here")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
