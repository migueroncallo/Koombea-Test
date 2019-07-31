//
//  Global functions.swift
//  Koombea Test
//
//  Created by Miguel Roncallo on 7/31/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import UIKit

func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
    guard let window = UIApplication.shared.keyWindow else { return }
    if animated {
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            let oldState: Bool = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            window.rootViewController = rootViewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: { (finished: Bool) -> () in
            if (completion != nil) {
                completion!()
            }
        })
    } else {
        window.rootViewController = rootViewController
    }
}
