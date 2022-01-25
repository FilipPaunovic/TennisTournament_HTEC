//
//  PlayersResponseModel.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 20.1.22..
//

import Foundation

struct PlayersResponseModel : Codable {
    let success : Bool
    let players : [Player]
    let message : String

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case players = "data"
        case message = "message"
    }

}

