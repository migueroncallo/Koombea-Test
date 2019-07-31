//
//  FootballAPI.swift
//  Koombea Test
//
//  Created by Miguel Roncallo on 7/31/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Alamofire

class FootballAPI{
    static let shared = FootballAPI()
    
    func getLeagues(_ cb: @escaping(Error?, [League]?)->()){
        let params = [
            "met": "Leagues",
            "APIkey": apiKey
        ]
        Alamofire.request(baseURL, method: .get, parameters: params)
        .validate()
            .responseJSON { (response) in
                
                switch response.result{
                case .success:
                    let decoder = JSONDecoder()
                    let leagues = try! decoder.decode(LeagueRoot.self, from: response.data!)
                    cb(nil, leagues.result)
                    
                case .failure(let error):
                    cb(error, nil)
                }
        }
    }
    
    func getLeagueStandings(_ leagueId: String, _ cb: @escaping (Error?, [Standing]?)->()){
        let params = [
            "met": "Standings",
            "APIkey": apiKey,
            "leagueId": leagueId
        ]
        
        Alamofire.request(baseURL, method: .get, parameters: params)
        .validate()
            .responseJSON { (response) in
                switch response.result{
                case .success:
                    let decoder = JSONDecoder()
                    let str = String(decoding: response.data!, as: UTF8.self)
                    print(str)
                    let standings = try! decoder.decode(StandingsRoot.self, from: response.data!)
                    cb(nil, standings.result.total)
                    
                case .failure(let error):
                    cb(error, nil)
                }
        }
    }
}
