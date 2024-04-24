//
//  AppNavegationController.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 12/04/24.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController()
        let  tabBarController = TapBarControllerViewController()
        
        pushViewController(tabBarController, animated: false)
        self.viewControllers = [homeViewController]
    }
}
