//
//  StandingsTableViewCell.swift
//  Koombea Test
//
//  Created by Miguel Roncallo on 7/31/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import UIKit

class StandingsTableViewCell: UITableViewCell {

    
    //MARK: - Variables
    
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var gamesWonLabel: UILabel!
    
    @IBOutlet weak var gamesTiedLabel: UILabel!
    
    @IBOutlet weak var gamesLostLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Internal helpers
    
    func configCell(_ standing: Standing){
        positionLabel.text = standing.place
        teamNameLabel.text = standing.teamName
        gamesWonLabel.text = standing.gamesWon
        gamesTiedLabel.text = standing.gamesTied
        gamesLostLabel.text = standing.gamesLost
        pointsLabel.text = standing.points
    }
    
}
