//
//  League.swift
//  Koombea Test
//
//  Created by Miguel Roncallo on 7/31/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

struct LeagueRoot: Codable{
    var result: [League]
}

struct League: Codable{
    var leagueKey: String
    var leagueName: String
    var countryKey: String
    var countryName: String
    
    private enum leagueCodingKeys: String, CodingKey{
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: leagueCodingKeys.self)
        leagueKey = try container.decode(String.self, forKey: .leagueKey)
        leagueName = try container.decode(String.self, forKey: .leagueName)
        countryKey = try container.decode(String.self, forKey: .countryKey)
        countryName = try container.decode(String.self, forKey: .countryName)
    }
}
