//
//  TabHomeView.swift
//  GameStream
//
//  Created by Alejandro Reyna on 22/03/23.
//

import SwiftUI

struct TabHomeView: View {
    @State var searchText = ""
    
    var body: some View {
        ZStack {
            Color("Dark-Blue").ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 5)
                    .padding(.top, 10)
                
                HStack {
                    Button {
                        search()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchText.isEmpty ? .yellow : Color("Dark-Cyan"))
                    }
                    
                    TextField(
                        text: $searchText,
                        label: {
                            Text("Search a video").foregroundColor(Color("Text-Gray"))
                        })
                        .foregroundColor(.white)

                }
                .padding([.top, .leading, .bottom], 11)
                .background(Color("Light-Blue"))
                .clipShape(Capsule())
            }
            .padding(.horizontal, 10)
            
        }.toolbar(.hidden)
    }
    
    func search() -> Void {
        print("User is looking for \(searchText)")
    }
}

struct TabHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabHomeView()
    }
}
