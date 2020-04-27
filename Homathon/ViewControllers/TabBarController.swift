//
//  TabBarController.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/22/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import UIKit
import TransitionableTab

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

}

extension TabBarController: TransitionableTab {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return animateTransition(tabBarController, shouldSelect: viewController)
    }
}
