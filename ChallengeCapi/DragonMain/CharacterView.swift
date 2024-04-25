//
//  CharacterView.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit


protocol CharacterViewDelegate: AnyObject {
    func characterView(_ characterView: CharacterView, didSelectCharacter character: Character)
    func characterViewStartPullToRefresh(_ characterView: CharacterView)
}

class CharacterView: UIView {
    
    private lazy var clvCharacters: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let clv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clv.backgroundColor = UIColor(red: 41/255, green: 40/255, blue: 40/255, alpha: 1.0)
        self.backgroundColor = UIColor(red: 41/255, green: 40/255, blue: 40/255, alpha: 1.0)
        clv.showsVerticalScrollIndicator = false
        clv.translatesAutoresizingMaskIntoConstraints = false
        clv.keyboardDismissMode = .onDrag
        return clv
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.pullToRefresh(_:)), for: .valueChanged)
        return refresh
    }()
    
    private lazy var srcCharacters: UISearchBar = {
        let src = UISearchBar(frame: .zero)
        src.translatesAutoresizingMaskIntoConstraints = false
        src.barTintColor = UIColor(red: 41/255, green: 40/255, blue: 40/255, alpha: 1.0)

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
        self.setupAdapters()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setupAdapters()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addElements()
        self.setupAdapters()
    }
    
    func setupAdapters() {
        self.listAdapter?.setCollectionView(self.clvCharacters)
        self.searchAdapter?.setSearchBar(self.srcCharacters)
        self.clvCharacters.addSubview(self.refreshControl)
        
        self.listAdapter?.didSelectHandler { character in
            self.delegate?.characterView(self, didSelectCharacter: character)
        }
        
        self.searchAdapter?.didFilterHandler { result in
            self.reloadCollectionView(result)
        }
    }
    
    func showLoading(_ isShow: Bool) {
        if isShow {
            self.refreshControl.beginRefreshing()
        } else {
            self.refreshControl.endRefreshing()
        }
    }
    
    private func reloadCollectionView(_ datasource: [Any]) {
        self.listAdapter?.datasource = datasource
        self.clvCharacters.reloadData()
    }
    
    func reloadData(_ datasource: [Character]) {
        self.searchAdapter?.datasource = datasource
        self.reloadCollectionView(datasource)
    }
    
    @objc private func pullToRefresh(_ refreshControl: UIRefreshControl) {
        self.delegate?.characterViewStartPullToRefresh(self)
    }
    
    func addElements() {
        self.backgroundColor = .white
        // Añadir vistas solo una vez
        self.addSubview(self.clvCharacters)
        self.addSubview(self.srcCharacters)
        
        NSLayoutConstraint.activate([
            // Restricciones para el UISearchBar
            self.srcCharacters.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.srcCharacters.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.srcCharacters.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            // Restricciones para el UICollectionView
            self.clvCharacters.topAnchor.constraint(equalTo: self.srcCharacters.bottomAnchor),
            self.clvCharacters.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.clvCharacters.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.clvCharacters.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
