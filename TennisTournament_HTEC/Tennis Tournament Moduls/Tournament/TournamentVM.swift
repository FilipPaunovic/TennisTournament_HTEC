//
//  TournamentVM.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 20.1.22..
//

import Foundation

class TournamentVM {
    weak var coordinator : TournamentCoordinator?
    
    func goToPlayersPage(){
        coordinator?.startPlayerList()
    }
}
