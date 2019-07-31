//
//  Standing.swift
//  Koombea Test
//
//  Created by Miguel Roncallo on 7/31/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
struct StandingsRoot: Codable{
    var result: StandingsTotal
}
struct StandingsTotal: Codable{
    var total: [Standing]
}

struct Standing: Codable{
    var place: String
    var teamName: String
    var points: String
    var gamesWon: String
    var gamesTied: String
    var gamesLost: String
    var teamKey: String

    private enum standingCodingKeys: String, CodingKey{
        
        case place = "standing_place"
        case teamName = "standing_team"
        case points = "standing_PTS"
        case gamesWon = "standing_W"
        case gamesTied = "standing_D"
        case gamesLost = "standing_L"
        case teamKey = "team_key"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: standingCodingKeys.self)
        place = try container.decode(String.self, forKey: .place)
        teamName = try container.decode(String.self, forKey: .teamName)
        points = try container.decode(String.self, forKey: .points)
        gamesWon = try container.decode(String.self, forKey: .gamesWon)
        gamesTied = try container.decode(String.self, forKey: .gamesTied)
        gamesLost = try container.decode(String.self, forKey: .gamesLost)
        teamKey = try container.decode(String.self, forKey: .teamKey)
    }
}
