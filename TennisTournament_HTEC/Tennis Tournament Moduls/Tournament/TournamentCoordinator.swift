//
//  TournamentCoordinator.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 24.1.22..
//

import UIKit
import SwiftUI

final class TournamentCoordinator: Coordinator {
    var children: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    //    let tournamentVC = TournamentVC.instance() // for UIKit
        let tournamentVM = TournamentVM.init()
        tournamentVM.coordinator = self
    //     tournamentVC.vm = tournamentVM // for UIKit
        
        let tournamentView = TournamentSwiftUIView(vm: tournamentVM)
        let host = UIHostingController(rootView: tournamentView)
        
        navigationController.setViewControllers([host], animated: false)

    }
    
    func startPlayerList() {
        let playerListCoordinator = PlayersCoordinator(navigationController: navigationController)
        playerListCoordinator.perent = self
        children.append(playerListCoordinator)
        playerListCoordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in children.enumerated() {
                if coordinator === child {
                    children.remove(at: index)
                    break
                }
            }
    }
    
}
