//
//  UserDataModel.swift
//  GameStream
//
//  Created by Alejandro Reyna on 29/03/23.
//

import Foundation

class UserDataModel {
    var email : String = ""
    var password : String = ""
    var name : String = ""
    
    func saveData(email : String, password : String, name : String) -> Bool {
        UserDefaults.standard.set([email, password, name], forKey: "userData")
        return true
    }
    
    func getData() -> [String]? {
        return UserDefaults.standard.stringArray(forKey: "userData")
    }
    
    func validateData(email : String, password : String) -> Bool {
        if let data = self.getData() {
            if data[0] == email && data[1] == password {
                return true
            }            
            return false
        }
        return false
    }
}
