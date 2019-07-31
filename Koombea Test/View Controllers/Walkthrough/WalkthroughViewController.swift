//
//  WalkthroughViewController.swift
//  Koombea Test
//
//  Created by Miguel Roncallo on 7/31/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController {

    //MARK: - Variables
    
    var walkthroughViews =  [UIViewController]()
    let onboardingFirstVC = OnboardingFirstViewController.init()
    let onboardingSecondVC = OnboardingSecondViewController.init()
    let onboardingThirdVC = OnboardingThirdViewController.init()
    var pageViewController: UIPageViewController?
    var pageControl = UIPageControl()
    
    //MARK: - Initializers
    
    init() {
        super.init(nibName: String(describing: WalkthroughViewController.self), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewPageController()
    }
    
    //MARK: - Internal Helpers
    
    func initWalkthroughViews(){
        walkthroughViews.append(onboardingFirstVC)
        walkthroughViews.append(onboardingSecondVC)
        walkthroughViews.append(onboardingThirdVC)
    }
    
    func configPageControl(){
        let viewFrame = self.view.frame
        pageControl = UIPageControl(frame: CGRect(x:viewFrame.width/2 - 50, y: viewFrame.height - 180, width: 100, height: 50))
        pageControl.numberOfPages = walkthroughViews.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.isUserInteractionEnabled = false
        pageViewController?.view.addSubview(pageControl)
    }
    
    func configViewPageController(){
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController?.dataSource = self
        
        if let containerView = pageViewController?.view {
            containerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(containerView)
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", options: .init(rawValue: 0), metrics: nil, views: ["containerView": containerView]))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[containerView]|", options: .init(rawValue: 0), metrics: nil, views: ["containerView": containerView]))
        }
        
        initWalkthroughViews()
        pageViewController?.setViewControllers([walkthroughViews[0]], direction: .forward, animated: true, completion: nil)
        configPageControl()
    }
}

//MARK: - UIPageViewControllerDataSource protocol conformance
extension WalkthroughViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard var index = (walkthroughViews.firstIndex { $0 == viewController }) else { return nil}
        pageControl.currentPage = index
        guard index - 1 >= 0 else { return nil }
        index -= 1
        return walkthroughViews[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard var index = (walkthroughViews.firstIndex { $0 == viewController }) else { return nil}
        pageControl.currentPage = index
        guard index + 1 < walkthroughViews.count else { return nil }
        
        index += 1
        return walkthroughViews[index]
    }
    
}

