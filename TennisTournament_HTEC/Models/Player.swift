//
//  PlayersResponseModel.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 20.1.22..
//


import Foundation
struct Player : Codable {
	let id : Int
	var firstName : String?
	let lastName : String?
	let points : Int
	let tournament_id : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case firstName = "firstName"
		case lastName = "lastName"
		case points = "points"
		case tournament_id = "tournament_id"

	}
}
