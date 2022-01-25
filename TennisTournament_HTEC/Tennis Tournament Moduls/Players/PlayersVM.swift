//
//  PlayersVM.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 20.1.22..
//

import Foundation

class PlayersVM {
    
    weak var coordinator : PlayersCoordinator?
    
    var playerList: ObservableObject<[Player]> = ObservableObject([])
    var error: ObservableObject<String> = ObservableObject("")

    required init() { //da se getPlayerList() poziva jos neggde na ekranu kesiranje bi islo unutar te metode, u ovom slucaju ovako mi deluje cistije
       CachePlayersHandler.sharedInstance.retrievePlayers(completion: { [self] players in
            if let players = players {
                self.playerList.value = players
            } else {
                getPlayerList()
            }
        })
    }
    
    func getPlayerList() {
        APIManager.shared.getPlayers(page: nil) { [self] players, error in
            if let error = error {
                self.error.value = error
                return
            }
            if !players.isEmpty {
                self.playerList.value = self.getRankSortedList(players: players)
                CachePlayersHandler.sharedInstance.cachePlayers(players: players)
                #if DEBUG //obzirom da nisam prosirivao model sa novim poljem za rank(jer kasnije to polje nigde ne koristim) zbog testiranja sam dodao pre imena rank u string.Rank u firstName Stringu ce se videti samo prilikom prvog otvaranja kasnije kad podaci budu dolazili iz kesa nece se prikazivati sve fo ponovnog starta app.
                    for (i,player) in self.playerList.value.enumerated() {
                        playerList.value[i].firstName = "\(i+1). " + (player.firstName ?? "")
                    }
                #endif
            }
        }
    }
    
    func getPlayerrForDraw(num: Int) -> [Player] {
        return Array(playerList.value.prefix(num))
    }
    
    func isValidatedNumberOfPlayersForDraw(num: Int) -> Bool {
        let possibileDraws = [4,8,16,32,64,128,512,1024]
        if num > playerList.value.count {
            error.value = "You don't have enough players for that draw"
            return false
        }
        
        if !possibileDraws.contains(num) {
            error.value = "You can not select thet number of players"
            return false
        }
        return true
    }
    
    func getRankSortedList(players: [Player]) -> [Player] {
        return players.sorted {$0.points > $1.points}
    }
    
    func numberOfRows() -> Int {
        return playerList.value.count
    }
    
    func getDataForCell(row: Int) -> Player {
        return playerList.value[row]
    }
    
    func startDraw(numOfPlayers: Int) {
        let playersForDraw = getPlayerrForDraw(num: numOfPlayers)
        coordinator?.startDraw(withPlayers: playersForDraw)
    }
    
    func closeVC() {
        coordinator?.didFinishPlayersVC()
    }
}


