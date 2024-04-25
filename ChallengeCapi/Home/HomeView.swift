//
//  HomeView.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 12/04/24.
//

import UIKit


@objc protocol HomeViewDelegate: AnyObject {
    func homeViewDidTapListButton2(_ homeView: HomeView)
}

class HomeView: UIView {
    @IBOutlet weak var delegate: HomeViewDelegate?
        
    @IBAction private func ButtonInit(_ sender: UIButton){
        self.delegate?.homeViewDidTapListButton2(self)
        if let animationButton = sender as? AnimationButton {
            animationButton.animateButton()
        }

    }
    
}

