//
//  PlayersCoordinator.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 24.1.22..
//

import UIKit

final class PlayersCoordinator: Coordinator {
    
    private(set) var children: [Coordinator] = []
    private let navigationController: UINavigationController
    var perent: TournamentCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        let playersVC = PlayersVC.instance()
        let playersVM = PlayersVM.init()
        playersVM.coordinator = self
        playersVC.vm = playersVM
        playersVC.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(playersVC, animated: true)
    }
    
    func startDraw(withPlayers: [Player]) {
        let drawCoordinator = DrawCoordinator(players: withPlayers, navigationController: navigationController)
        drawCoordinator.perent = self
        children.append(drawCoordinator)
        drawCoordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in children.enumerated() {
            if coordinator === child {
                children.remove(at: index)
                break
            }
        }
    }
    
    func didFinishPlayersVC() {
        perent?.childDidFinish(self)
    }
}
