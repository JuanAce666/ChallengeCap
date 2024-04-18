//
//  CharacterViewControllerBuilder.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit

extension CharacterViewController {
    class func buildSimple() -> CharacterViewController {
        let characterView = CharacterView(listAdapter: ListCharacterSimpleAdapter(), searchAdapter: SearchCharacterByInfoAdapter())
     /*   let controller = CharacterViewController(movieView: movieView, strategy: FavoritesStrategy(movieView: movieView), shouldLoadMoviesOnInit: true)
        return controller */
    }
    
    class func buildGrill() -> CharacterViewController {
        let characterView = CharacterView(listAdapter: ListCharacterSimpleAdapter(), searchAdapter: SearchCharacterByInfoAdapter())
      /*  let controller = CharacterViewController(movieView: movieView, strategy: MovieStrategy(movieView: movieView), shouldLoadMoviesOnInit: true)
        return controller*/
    }
}
