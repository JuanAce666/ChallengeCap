//
//  AnimationButton.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 15/04/24.
//

import UIKit

class AnimationButton: UIButton {
    
    // Inicializador para código
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    // Inicializador para Storyboards/XIBs
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setTitle("¡Inicia!", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        backgroundColor = UIColor.systemBlue
        setTitleColor(.white, for: .normal)
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.systemYellow.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 5
        layer.masksToBounds = false
    }
    
    func animateButton() {
        let shadowAnimation = CABasicAnimation(keyPath: "shadowRadius")
        shadowAnimation.fromValue = 5
        shadowAnimation.toValue = 15
        shadowAnimation.duration = 0.3
        shadowAnimation.autoreverses = true
        shadowAnimation.repeatCount = .infinity
        layer.add(shadowAnimation, forKey: "shadowRadiusAnimation")
        
        let opacityAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        opacityAnimation.fromValue = 0.7
        opacityAnimation.toValue = 0.3
        opacityAnimation.duration = 0.3
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = .infinity
        layer.add(opacityAnimation, forKey: "opacityAnimation")
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = 1.05
        scaleAnimation.duration = 0.3
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        layer.add(scaleAnimation, forKey: "transformScaleAnimation")
        
        // Añadimos una animación intermitente al backgroundColor similar a una explosión de Ki
        let colorGlowAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorGlowAnimation.fromValue = UIColor.systemBlue.cgColor
        colorGlowAnimation.toValue = UIColor.systemYellow.cgColor
        colorGlowAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        colorGlowAnimation.duration = 0.5
        colorGlowAnimation.autoreverses = true
        colorGlowAnimation.repeatCount = .infinity
        layer.add(colorGlowAnimation, forKey: "colorGlowAnimation")
    }
    
    func resetButtonAnimation() {
        layer.removeAllAnimations()
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.7
        transform = .identity
        backgroundColor = UIColor.systemBlue
    }
}
