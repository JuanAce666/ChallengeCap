//
//  HomeViewController.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 12/04/24.
//

import UIKit

class HomeViewController: ViewController {
    
    var homeView: HomeView? {
        self.view as? HomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func homeViewDidTapListButton2(_ homeView: HomeView) {
        self.performSegue(withIdentifier: "TapBarControllerViewController", sender: nil)
    }
}
