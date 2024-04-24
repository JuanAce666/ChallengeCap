//
//  CharacterContantViewController.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 22/04/24.
//

import UIKit

class CharacterContantViewController: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contentView = self.view as? CharacterContantView else { return }
        contentView.facebookButton.addTarget(self, action: #selector(openFacebook), for: .touchUpInside)
        contentView.InstagramButton.addTarget(self, action: #selector(openInstagram), for: .touchUpInside)
        contentView.TwitterButton.addTarget(self, action: #selector(openTwitter), for: .touchUpInside)
        contentView.TikTokButton.addTarget(self, action: #selector(openTiktok), for: .touchUpInside)
    }
    
    @objc func openFacebook() {
        if let facebookURL = URL(string: "https://www.facebook.com/") {
            if UIApplication.shared.canOpenURL(facebookURL) {
                UIApplication.shared.open(facebookURL, options: [:])
            }else {
                if let webURL = URL(string: "https://www.facebook.com/") {
                    UIApplication.shared.open(webURL, options: [:])
                }
            }
        }
    }
    
    @objc func openInstagram() {
        if let instagramURL = URL(string: "https://www.instagram.com/euforiacolectiva/") {
            if UIApplication.shared.canOpenURL(instagramURL) {
                UIApplication.shared.open(instagramURL, options: [:])
            } else {
                if let webURL = URL(string: "https://www.instagram.com/euforiacolectiva/") {
                    UIApplication.shared.open(webURL, options: [:])
                }
            }
        }
    }
    
    @objc func openTwitter() {
        if let twitterURL = URL(string: "https://twitter.com/JuanMalviajado") {
            if UIApplication.shared.canOpenURL(twitterURL) {
                UIApplication.shared.open(twitterURL, options: [:])
            } else {
                if let webURL = URL(string: "https://twitter.com/JuanMalviajado") {
                    UIApplication.shared.open(webURL, options: [:])
                }
            }
        }
    }
    
    @objc func openTiktok() {
        if let TiktokURL = URL(string: "https://www.tiktok.com/@malditopresagio") {
            if UIApplication.shared.canOpenURL(TiktokURL) {
                UIApplication.shared.open(TiktokURL, options: [:])
            } else {
                if let webURL = URL(string: "https://www.tiktok.com/@malditopresagio") {
                    UIApplication.shared.open(webURL, options: [:])
                }
            }
        }
    }
}
