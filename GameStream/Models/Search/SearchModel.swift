//
//  SearchModel.swift
//  GameStream
//
//  Created by Alejandro Reyna on 28/03/23.
//

import Foundation

class SearchModel : ObservableObject {

    @Published var info : [GameParser] = []
    @Published var hasError : Bool = false
    @Published var error : Error? = nil
    
    func requestData(search: String, finished: @escaping (_ isSuccess : Bool ) -> Void) {
        self.clearError()
        self.clearData()
        
        let sanitizedParams = search.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        if let url = URL(string: "\(Constants.searchEndpoint)?contains=\(sanitizedParams ?? "")") {
            print(url)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                do {
                    if let givenData = data {
                        let decodedData = try JSONDecoder().decode(SearchParser.self, from: givenData)
                        
                        DispatchQueue.main.async {
                            self.info.append(contentsOf: decodedData.results)
                            finished(true)
                        }
                        
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.hasError = true
                        self.error = error
                        finished(false)
                    }
                }
            }.resume()
        }
    }
    
    func clearData() -> Void {
        self.info.removeAll()
    }
    
    func clearError() -> Void {
        self.hasError = false
        self.error = nil
    }
}
