//
//  OnboardingThirdViewController.swift
//  Koombea Test
//
//  Created by Miguel Roncallo on 7/31/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import UIKit

class OnboardingThirdViewController: UIViewController {

    //MARK: - Variables
    
    let defaults = UserDefaults()
    @IBOutlet weak var getStartedButton: UIButton!
    
    //MARK: - Initializers
    init() {
        super.init(nibName: String(describing: OnboardingThirdViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
    }
    
    //MARK: - Internal Helpers
    func configViews(){
        getStartedButton.layer.cornerRadius = 5
    }
    //MARK: - IBActions
    
    @IBAction func getStartedAction(_ sender: UIButton) {
        
        let leaguesListVc = LeaguesViewController.init()
        let mainNav = UINavigationController(rootViewController: leaguesListVc)
        defaults.set(true, forKey: IS_FIRST_TIME_KEY)
        switchRootViewController(rootViewController: mainNav, animated: true, completion: nil)
    }
}
