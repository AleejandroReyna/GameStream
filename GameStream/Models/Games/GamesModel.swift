//
//  Game.swift
//  GameStream
//
//  Created by Alejandro Reyna on 27/03/23.
//

import Foundation

class GamesModel : ObservableObject {
    
    @Published var info : [GameParser] = []
    @Published var hasError : Bool = false
    @Published var error : Error? = nil
    
    init() {
        self.requestData()
    }
    
    func requestData() -> Void {
        self.clearError()
        if let url = URL(string: Constants.gamesEndpoint) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                do {
                    if let givenData = data {
                        print("given data: ", givenData)
                        let decodedData = try JSONDecoder().decode([GameParser].self, from: givenData)
                        
                        DispatchQueue.main.async {
                            self.info.append(contentsOf: decodedData)
                        }
                    }
                } catch {
                    self.hasError = true
                    self.error = error
                }
            }.resume()
        }
    }
    
    func clearError() -> Void {
        self.hasError = false
        self.error = nil
    }
}
