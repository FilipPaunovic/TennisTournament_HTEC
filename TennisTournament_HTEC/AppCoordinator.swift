//
//  AppCoordinator.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 24.1.22..
//

import UIKit

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    
    private(set) var children: [Coordinator] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        navigationController.navigationBar.tintColor = .systemPink
        let tournamentCoordinator = TournamentCoordinator(navigationController: navigationController)
        children.append(tournamentCoordinator)
        tournamentCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

