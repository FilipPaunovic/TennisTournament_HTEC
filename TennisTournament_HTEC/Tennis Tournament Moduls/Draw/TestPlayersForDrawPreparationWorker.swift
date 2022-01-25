//
//  TestPlayersForDrawPreparationWorker.swift
//  TennisTournament_HTECTests
//
//  Created by Filip Paunovic on 23.1.22..
//
@testable import TennisTournament_HTEC
import XCTest


class TestPlayersForDrawPreparationWorker: XCTestCase {

    var preparationForDraw: PlayersForDrawPreparationWorker!
    let numberOfPlayers = 512
    var players = [Player]()
    
    override func setUp() {
        super.setUp()
        preparationForDraw = PlayersForDrawPreparationWorker()
        for i in 1...numberOfPlayers {
            let player = Player(id: i, lastName: nil, points: 0, tournament_id: nil)
            players.append(player)
        }
    }
    
    override func tearDown() {
        super.tearDown()
        preparationForDraw = nil
    }
    
    func test_is_player_number_rounds_correct() throws {
        // for number of players(P) 8 rounds(R) 3 -> P 16 R 4 -> P 32 R 5 -> P 64 R 6 -> P 128 R 7 -> P 256 R 8 -> P 512 R 9
        let numberOfRounds = 9
        let rounds = preparationForDraw.getMatches(playerList: players)
        let roundsNumber = rounds.count
        
        XCTAssertEqual(roundsNumber, numberOfRounds)
    }
    
    func test_is_players_shuffeld_possitions() throws {
      
        let rounds = preparationForDraw.getMatches(playerList: players)
        let playersSortedForDraw = rounds.first
        let numOfFalse = numberOfPlayers/2
        var numOfFalseExpected = 0
        for (i,player) in playersSortedForDraw!.enumerated() {
            if i == player.firstPlayer.id && i+1 == player.secondPlayer.id {
                print(true)
            } else {
                numOfFalseExpected += 1
                print(false)
            }
        }
        XCTAssertTrue(numOfFalseExpected == numOfFalse)
    
    }
}
