//
//  HomeView.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 12/04/24.
//

import UIKit

class HomeView: UIView {
        
    @IBAction private func ButtonInit(_ sender: UIButton){
        if let animationButton = sender as? AnimationButton {
            animationButton.animateButton()
        }
    }
    
}

