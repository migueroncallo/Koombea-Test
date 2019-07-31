//
//  StandingsViewController.swift
//  Koombea Test
//
//  Created by Miguel Roncallo on 7/31/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class StandingsViewController: UIViewController , NVActivityIndicatorViewable{
    
    //MARK: - Variables
    
    var league: League!
    var standings = [Standing]()
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Initializers
    
    init(league: League) {
        super.init(nibName: String(describing: StandingsViewController.self), bundle: nil)
        self.league = league
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configTableView()
        loadData()
    }
    
    //MARK: - Internal helpers
    
    func loadData(){
        startAnimating()
        FootballAPI.shared.getLeagueStandings(league.leagueKey) { (error, standings) in
            self.stopAnimating()
            if let _ = error{
                print("Error loading Standings")
            }else{
                self.standings = standings!
                self.tableView.reloadData()
            }
        }
    }
    
    func configNavigationBar(){
        self.title = "Standings"
        let backArrowImage = UIImage(named: "Back Arrow")!
        
        self.navigationController?.navigationBar.backIndicatorImage = backArrowImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backArrowImage
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func configTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: StandingsTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: StandingsTableViewCell.self))
        tableView.tableFooterView = UIView()
    }
}
//MARK: - UITableViewDataSource protocol conformance

extension StandingsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StandingsTableViewCell.self)) as! StandingsTableViewCell
        cell.configCell(standings[indexPath.row])
        return cell
    }
}

extension StandingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         return UIView()
    }
}
