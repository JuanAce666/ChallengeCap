//
//  CharacterView.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit

protocol CharacterViewDelegate: AnyObject {
   // func characterView(_ characterView: CharacterView, didselectMovie character: Character)
    func characterViewStartPullToRefresh(_ characterView: CharacterView)
}

class CharacterView: UIView {
    
    private lazy var clvCharacters: UICollectionView = {
        let clv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        clv.backgroundColor = .white
        clv.showsVerticalScrollIndicator = false
        clv.translatesAutoresizingMaskIntoConstraints = false
        clv.keyboardDismissMode =  .onDrag
        return clv
    } ()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.pulltoRefresh(_:)), for: .valueChanged)
        return refresh
    }()
    
    private lazy var srcCharacters: UISearchBar = {
        let src = UISearchBar(frame: .zero)
        src.translatesAutoresizingMaskIntoConstraints = false // para habilitar los constraints para compartir frames a constraints
        return src
    }()
    
    weak var delegate: CharacterViewDelegate?
    private var listAdapter: ListCharacterAdapterProtocol?
     private var searchAdapter: SearchCharacterAdapterProtocol?
    
    init(listAdapter: ListCharacterAdapterProtocol, searchAdapter: SearchCharacterAdapterProtocol) {
        self.listAdapter = listAdapter
        self.searchAdapter = searchAdapter
        super.init(frame: .zero)
        self.addElements()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addElements()
    }
    
    func setupAdapters() {
        self.listAdapter?.setCollectionView(self.clvCharacters)
        self.searchAdapter?.setSearchBar(self.srcCharacters)
        self.clvCharacters.addSubview(self.refreshControl)
        
       /* self.listAdapter?.didSelectHandler { movie in
             self.delegate?.CharacterView(self, didselectMovie: movie)
             }
             self.searchAdapter?.didFilterHandler({ result in
             self.reloadCollectionView(result)
             }) */
        }
        
        func showLoading(_ isShow: Bool) {
            isShow ? self.refreshControl.beginRefreshing() : self.refreshControl.endRefreshing()
        }
        
        private func reloadCollectionView(_ datasource: [Any]) {
            self.listAdapter?.datasource = datasource
            self.clvCharacters.reloadData()
        }
        
        /* func reloadData(_ datasource: [Movie]) {
         self.searchAdapter?.datasource = datasource
         self.reloadCollectionView(datasource)
         }*/
        
        @objc private func pulltoRefresh(_ refreshControl: UIRefreshControl) {
            self.delegate?.characterViewStartPullToRefresh(self)
        }
        
        func addElements() {
            self.backgroundColor = .white
            self.addSubview(self.clvCharacters)
            self.addSubview(self.clvCharacters)
            
            NSLayoutConstraint.activate([
                self.srcCharacters.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                self.srcCharacters.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.srcCharacters.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                
                self.srcCharacters.topAnchor.constraint(equalTo: self.srcCharacters.bottomAnchor),
                self.srcCharacters.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.srcCharacters.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                self.srcCharacters.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
    }

