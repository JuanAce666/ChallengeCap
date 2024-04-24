//
//  CharacterViewController.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit

class CharacterViewController: UIViewController {
    
    private var shouldLoadMoviesOnInit: Bool
  //  private var strategy: CharacterStrategyProtocol
    private var characterView: CharacterView
 //   private var characters: [Characters] = []
  //  private lazy var webServices = DragonWS()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.characterView
       // self.characterView.delegate = self
     //   self.characterView.setupAdapters()
      
      /*  if shouldLoadMoviesOnInit {
            strategy.getMovies()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(handleFavoritesUpdatedNotification), name: Notification.Name("FavoritesUpdated"), object: nil)*/
    }
    
    private func getAll() {
        /*  self.characterView.showLoading(true)
          self.webServices.fetch { arrayMovieDTO in
            self.characterView.showLoading(false)
            self.characterView.reloadData(arrayMovieDTO.toMovie)
        }*/
    }
        
    func loadFavorites() {
      //  strategy.getMovies()
    }
    
   /* init(movieView: MoviesView, strategy: MovieStrategyProtocol, shouldLoadMoviesOnInit: Bool) {
        self.movieView = movieView
        self.strategy = strategy
        self.shouldLoadMoviesOnInit = shouldLoadMoviesOnInit
        super.init(nibName: nil, bundle: nil)
    }*/
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
   /* private func selectedImage(_ movie: Movie) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailsVC.movieId = movie.id
        detailsVC.movie = movie
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    @objc private func handleFavoritesUpdatedNotification() {
        // Actualizar la vista según sea necesario
        strategy.getMovies()
    }
}

extension MoviesViewController: MovieViewDelegate {
    func movieViewStartPullToRefresh(_ movieView: MoviesView) {
        self.getAll()
    }
    
    func movieView(_ movieView: MoviesView, didselectMovie movie: Movie) {
        self.selectedImage(movie)
    } */
}
