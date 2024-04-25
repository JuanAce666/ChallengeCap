//
//  CharacterCollectionViewCell.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 17/04/24.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var power: UILabel!
    @IBOutlet private weak var imgCharacter: UIImageView!
    
    
    
    fileprivate func updateDataWith(_ character: Character) {
        let baseURLImage = "https://image.tmdb.org/t/p/w500"
        let urlImage = baseURLImage + character.imagenUrl
        guard let url = URL(string: urlImage) else {return}
        // Crear y manejar la solicitud de datos de la imagen
            URLSession.shared.dataTask(with: url) {(data, response, error) in guard let imageData = data else { return }
              DispatchQueue.main.async {
                self.imgCharacter.image = UIImage(data: imageData)
              }
            }.resume()
        self.name.text = character.nombre
        let power = String(character.nivelDePoder)
        self.power.text = power
          }
}

extension CharacterCollectionViewCell {
    
    class var indentifier: String { "CharacterCollectionViewCell" }
    
    class func buildIn(_ collectionView: UICollectionView, in indexPath: IndexPath, with character: Character) -> Self {
        // Obtener una celda reutilizable del collectionView utilizando el identificador.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.indentifier, for: indexPath) as? Self
        // Actualizar la celda con la información de la película.
        cell?.updateDataWith(character)
        
        // Devolver la celda construida, o una instancia nueva de Self si no se puede obtener la celda reutilizable.
        return cell ?? Self()
    }
}
