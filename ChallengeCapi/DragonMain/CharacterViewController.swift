//
//  CharacterViewController.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit

class CharacterViewController: UIViewController {
    
    private var characterView: CharacterView
    private var characters: [Character] = []
    private lazy var webServices = DragonWS()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.characterView
        self.characterView.delegate = self
        self.characterView.setupAdapters()
    }
    
    private func getAll() {
        self.characterView.showLoading(true)
        self.webServices.fetch(idCharacter: 123) { arrayCharacterDTO in
        self.characterView.showLoading(false)
        self.characterView.reloadData(arrayCharacterDTO.toCharacter)
        }
    }
    
    init(characterView: CharacterView) {
        self.characterView = characterView
        super.init(nibName: nil, bundle: nil)
    }
  
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
     private func selectedImage(_ character: Character) {
     let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
     let detailsVC = storyBoard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as! CharacterDetailViewController
     detailsVC.characterId = character.id
     detailsVC.character = character
     self.navigationController?.pushViewController(detailsVC, animated: true)
     }
}

extension CharacterViewController: CharacterViewDelegate {
    func characterView(_ characterView: CharacterView, didSelectCharacter character: Character) {
        self.selectedImage(character)
    }
    
    func characterViewStartPullToRefresh(_ characterView: CharacterView) {
        self.getAll()
    }

}
