//
//  ListCharacterAdapterProtocol.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit

protocol ListCharacterAdapterProtocol: AnyObject {
    
    var datasource: [Any] {get set}
    func setCollectionView(_ collectionView: UICollectionView)
    func didSelectHandler(_ handler: @escaping (_ character: Character) -> Void)
}

