//
//  PlayersForDrawPreparationWorker.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 23.1.22..
//

import Foundation

class PlayersForDrawPreparationWorker {
  
    func getMatches(playerList:[Player]) -> [[Match]] {
        let numOfPlayersForDraw = playerList.count
        var roundsArray = [[Match]]()
        var finalArray = [Player]()
        let shuffledPlayersArray = shuflePlayers(indexPlayerList: playerList)
        let indexes = setPlayersPositionIndex(numPlayers: numOfPlayersForDraw)
        
        indexes.forEach { index in
            finalArray.append(shuffledPlayersArray[index-1])
        }
        
        var temoMatchArray = [Match]()
        for (i,player) in finalArray.enumerated() {
            if(i%2 == 0) && i != numOfPlayersForDraw-1  {
                temoMatchArray.append(Match(firstPlayer: player, secondPlayer: finalArray[i+1]))
            }
        }
       
        roundsArray.append(temoMatchArray)
        
        for numOfPlayersInRound in getNumForRestOfRounds(numOfPlayers: numOfPlayersForDraw) {
            var matchArray = [Match]()
            for _ in 1...numOfPlayersInRound {
                let playerFake = Player(id: 0, firstName: nil, lastName: nil, points: 0, tournament_id: nil)
                matchArray.append(Match(firstPlayer: playerFake, secondPlayer: playerFake))
            }
            roundsArray.append(matchArray)
        }
        print(roundsArray)
        return roundsArray
    }

    private func getNumForRestOfRounds(numOfPlayers: Int) -> [Int] {
        if numOfPlayers == 0 { return [] }
        var playerCount = numOfPlayers/2
        var roundArray = [Int]()
        while playerCount%2 == 0 {
            playerCount = playerCount/2
            roundArray.append(playerCount)
        }
        return roundArray
    }
    
    private func setPlayersPositionIndex(numPlayers: Int) -> [Int] {
        guard numPlayers != 0 else {return []}
        let rounds = log(Float(numPlayers/2))/log(Float(2))-1
        var pls = [1,2]
            for _ in 0...Int(rounds) {
                var out = [Int]()
                let length = pls.count*2+1
                pls.forEach { d in
                    out.append(d)
                    out.append(length-d)
                }
                pls = out
           
            }
            return pls
    }
    
    private func shuflePlayers(indexPlayerList: [Player]) -> [Player] {
        let splitArrays = indexPlayerList.devided()
        let finallist = splitArrays.0 + splitArrays.1.shuffledRandom()
        return finallist
    }
}
