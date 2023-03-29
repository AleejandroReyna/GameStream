//
//  Constants.swift
//  GameStream
//
//  Created by Alejandro Reyna on 26/03/23.
//

import Foundation

struct Constants {
    static let defaultEndpoint = "https://gamestreamapi.herokuapp.com/api"
    static let gamesEndpoint = Self.defaultEndpoint + "/games"
    static let searchEndpoint = Self.defaultEndpoint + "/games/search"
}
