//
//  DrawCoordinator.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 24.1.22..
//

import UIKit

final class DrawCoordinator: Coordinator {
    private(set) var children: [Coordinator] = []
    var perent: PlayersCoordinator?
    private let navigationController: UINavigationController
    private let players: [Player]
    
    init(players: [Player],navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.players = players
    }
    
    func start() {
        let drawVC = DrawVC.instance()
        let drawVM = DrawVM(playersForDraw: players)
        drawVC.vm = drawVM
        drawVC.modalPresentationStyle = .fullScreen
        navigationController.present(drawVC, animated: true, completion: nil)
    }
    
    func didFinishDrawVC() {
        perent?.childDidFinish(self)
    }
}
