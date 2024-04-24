//
//  ErrorCollectionViewCell.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 18/04/24.
//

import UIKit

class ErrorCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet private weak var LblMessage2: UILabel!
    
    fileprivate func updateDataWith(_  text: String) {
        self.LblMessage2.text = text
    }
}

extension ErrorCollectionViewCell {
    class var indentifier: String {"ErrorCollectionViewCell"}
    
    class func buildIn(_ collectionView: UICollectionView, in indexPath: IndexPath, with text: String) -> Self {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.indentifier, for: indexPath) as? Self
        cell?.updateDataWith(text)
        return cell ?? Self()
    }
}
