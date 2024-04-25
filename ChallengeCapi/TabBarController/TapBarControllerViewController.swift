//
//  TapBarControllerViewController.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit

class TapBarControllerViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let third = storyboard.instantiateViewController(withIdentifier: "CharacterContantViewController") as? CharacterContantViewController else {
            fatalError("No se pudo instanciar CharacterContantViewController")
        }
        third.tabBarItem = UITabBarItem(title: "Contact", image: UIImage(systemName: "iphone"), selectedImage: UIImage(systemName: "iphone.fill"))

        
       let first = CharacterViewController.buildGrill()
       let second = CharacterViewController.buildSimple()
        
        first.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
        second.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star"))
        
        viewControllers = [first,second,third]
    }
}
