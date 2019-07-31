//
//  LeaguesViewController.swift
//  Koombea Test
//
//  Created by Miguel Roncallo on 7/31/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LeaguesViewController: UIViewController, NVActivityIndicatorViewable {
    
    //MARK: - Variables
    @IBOutlet weak var collectionView: UICollectionView!
    
    var leagues = [League]()
    
    //MARK: - Initializers
    
    init() {
        super.init(nibName: String(describing: LeaguesViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configCollectionView()
        loadLeagues()
    }
    
    //MARK: - Iternal helpers
    
    func loadLeagues(){
        startAnimating()
        FootballAPI.shared.getLeagues { (error, leagues) in
            self.stopAnimating()
            if let _ = error{
                print("Error loading leagues")
            }else{
                print(leagues!)
                self.leagues = leagues!
                self.collectionView.reloadData()
            }
        }
    }
    
    func configCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: LeaguesListCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: LeaguesListCollectionViewCell.self))
    }
    
    func configNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 249/255, green: 96/255, blue: 96/255, alpha: 1)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.title = "Leagues"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
}

//MARK: - UICollectionViewDataSource protocol conformance

extension LeaguesViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LeaguesListCollectionViewCell.self), for: indexPath) as! LeaguesListCollectionViewCell
        
        cell.configCell(leagues[indexPath.row])
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate protocol conformance
extension LeaguesViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leagueSelected = leagues[indexPath.row]
        let leagueStandingsVc = StandingsViewController.init(league: leagueSelected)
        self.navigationController?.pushViewController(leagueStandingsVc, animated: true)
    }
}


//MARK: - UICollectionViewDelegateFlowLayout protocol conformance

extension LeaguesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumInteritemSpacing = 18
        layout.minimumLineSpacing = 18
        layout.invalidateLayout()
        
        return CGSize(width: (self.view.frame.width - 50), height: 113)
    }
}
