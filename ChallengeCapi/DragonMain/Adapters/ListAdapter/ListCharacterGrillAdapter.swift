//
//  ListCharacterGrillAdapter.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit

class ListCharacterGrillAdapter: NSObject, ListCharacterAdapterProtocol{
    private unowned var collectionView: UICollectionView?

    // Manejador de selección de películas, se convierte en un callback
    private var didSelect: ((_ character: Character) -> Void)?

    // Origen de datos de las películas
    var datasource = [Any]() {
        didSet {
            self.datasource is [Character] ? self.setCaractersLayout() : self.setErrorLayout()
        }
    }
    
    
    func setCollectionView(_ collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView = collectionView
        self.setCaractersLayout()
        self.collectionView?.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CharacterCollectionViewCell")
        self.collectionView?.register(UINib(nibName: "ErrorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ErrorCollectionViewCell")
    }
    
    func didSelectHandler(_ handler: @escaping (_ character: Character) -> Void) {
        self.didSelect = handler
    }
    
    private func setCaractersLayout() {
        //definir lauout con dimension de la celda
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(.leastNormalMagnitude))
        let item = NSCollectionLayoutItem(layoutSize: layoutSize)
        //definir un grupo en horizontal o vertical segun la direccion del scroll es un conjunto de items
        let layoutGroup = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(.leastNormalMagnitude))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitem: item, count: 1)
        group.interItemSpacing = .fixed(20)
        //definir la seccion que es un conjunto de grupos
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15)
        section.interGroupSpacing = 20
        //creas el layout del collection y se lo asigna
        let layout = UICollectionViewCompositionalLayout(section: section)
        self.collectionView?.collectionViewLayout = layout
    }
    
    private func setErrorLayout() {
        //definir lauout con dimension de la celda
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: layoutSize)
        //definir un grupo en horizontal o vertical segun la direccion del scroll es un conjunto de items
        let layoutGroup = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitem: item, count: 1)
        group.interItemSpacing = .fixed(0)
        //definir la seccion que es un conjunto de grupos
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.interGroupSpacing = 0
        //creas el layout del collection y se lo asigna
        let layout = UICollectionViewCompositionalLayout(section: section)
        self.collectionView?.collectionViewLayout = layout
    }
}

extension ListCharacterGrillAdapter: UICollectionViewDataSource {
    //Devuelve el número de elementos en la sección especificada
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Retorna la cantidad de elementos
        self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = self.datasource[indexPath.row]
        
        if let message = item as? String {
            return ErrorCollectionViewCell.buildIn(collectionView, in: indexPath, with: message)
        }else if let character = item as? Character {
            return  CharacterCollectionViewCell.buildIn(collectionView, in: indexPath, with: character)
        }else {
            return UICollectionViewCell()
        }
    }
}

extension ListCharacterGrillAdapter: UICollectionViewDelegate {
    // Se llama cuando se selecciona un elemento en la vista
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Llama al handler de selección con la película correspondiente en el índice seleccionado
        guard let character = self.datasource[indexPath.row] as? Character else { return }
        self.didSelect?(character)
        print(1)
    }
}
