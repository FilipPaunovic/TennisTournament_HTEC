//
//  ApiManager.swift
//  TennisTournament_HTEC
//
//  Created by Filip Paunovic on 20.1.22..
//

import Foundation
import Alamofire


fileprivate var headers: HTTPHeaders = ["x-tournament-id": "822344"]
fileprivate var limit = 10

final class APIManager  {
    
    static let shared = APIManager()
    private init() { }
   
   
    private var baseurl = "http://internships-mobile.htec.co.rs/api/"
    
    func getPlayers(page: String?,completion: @escaping([Player],String?) -> Void) {
        var url = ""
        if let page = page {
            url = baseurl + "players?page=\(page)&limit=\(limit)"
        } else {
            url = baseurl + "players"
        }
        
        AF.request(url, headers: headers)
            .validate()
            .responseDecodable(of: PlayersResponseModel.self) { (response) in
            guard let playersResponse = response.value else {
                if let error = response.error {
                    completion([], error.errorDescription)
                }
            completion([], "Soething went wrong")
            return
            }
                if playersResponse.success {
                    completion(playersResponse.players,nil)
                } else {
                    completion([], playersResponse.message)
                }
            }
    }
}

