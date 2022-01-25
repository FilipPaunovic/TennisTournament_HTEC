//
//  TestPlayersVM.swift
//  TennisTournament_HTECTests
//
//  Created by Filip Paunovic on 24.1.22..
//

@testable import TennisTournament_HTEC
import XCTest

class TestPlayersVM: XCTestCase {

    var playerVM: PlayersVM!
    let numberOfPlayers = 32
    var players = [Player]()
    
    override func setUp() {
        super.setUp()
        playerVM = PlayersVM()
        for i in 1...numberOfPlayers {
            let player = Player(id: i, lastName: nil, points: 0, tournament_id: nil)
            players.append(player)
        }
    }
    
    override func tearDown() {
        super.tearDown()
        playerVM = nil
    }
  
    func test_is_validated_number_of_players_for_draw() throws {
       
        let inputNumberOfPlayersForDraw = 16
        playerVM.playerList.value = players
        XCTAssertTrue(playerVM.isValidatedNumberOfPlayersForDraw(num: inputNumberOfPlayersForDraw), playerVM.error.value)
    }
    
}
