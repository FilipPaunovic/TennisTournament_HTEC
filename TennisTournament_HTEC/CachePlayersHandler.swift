//
//  ChachedPlayers.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 24.1.22..
//

import UIKit




final class CachePlayersHandler {
    
    private let cache = NSCache<AnyObject, AnyObject>()
    static let sharedInstance = CachePlayersHandler()
    private let key = "PlayersCache"
   
    func cachePlayers(players: [Player]) {
        cache.setObject(players as AnyObject, forKey: key as AnyObject)
    }
   
    func retrievePlayers(completion: @escaping ([Player]?) -> Void) {
        if let players = cache.object(forKey: key as AnyObject) as? [Player] {
            completion(players)
        } else {
            completion(nil)
        }
    }
   
    
    

    
    

}
