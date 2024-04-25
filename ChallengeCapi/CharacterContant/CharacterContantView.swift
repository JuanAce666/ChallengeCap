//
//  CharacterContantView.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 22/04/24.
//

import UIKit


class CharacterContantView: UIView {
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var InstagramButton: UIButton!
    @IBOutlet weak var TwitterButton: UIButton!
    @IBOutlet weak var TikTokButton: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
    }
}
