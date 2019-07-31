//
//  LeaguesListCollectionViewCell.swift
//  Koombea Test
//
//  Created by Miguel Roncallo on 7/31/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import UIKit

class LeaguesListCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Variables
    
    @IBOutlet weak var leagueNameLabel: UILabel!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var leagueCodeLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Internal helpers

    func configCell(_ league: League){
        leagueNameLabel.text = league.leagueName
        leagueCodeLabel.text = league.leagueKey
        countryNameLabel.text = league.countryName
    }
}
