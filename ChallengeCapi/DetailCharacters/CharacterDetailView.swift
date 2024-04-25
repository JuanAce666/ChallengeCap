//
//  CharacterDetailView.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 22/04/24.
//

import UIKit

class CharacterDetailView: UIView {
    
    @IBOutlet private weak var name3: UILabel!
    @IBOutlet private weak var nivel: UILabel!
    @IBOutlet private weak var descripcion: UILabel!
    @IBOutlet private weak var imgMovie3: UIImageView!
    
    func dataInjection(fromModel model: Character) {
         updateDataWith(model)
     }
    
    func updateDataWith(_ detail: Character) {
    let baseURLImage = "https://image.tmdb.org/t/p/w500"
    
    // Actualizar el póster de la película
    let posterURLImage = baseURLImage + detail.imagenUrl
    if let posterURL = URL(string: posterURLImage) {
        URLSession.shared.dataTask(with: posterURL) { (data, response, error) in
            guard let imageData = data else { return }
            DispatchQueue.main.async {
                self.imgMovie3.image = UIImage(data: imageData)
            }
        }.resume()
        self.name3.text = detail.nombre
        self.descripcion.text = detail.description
        let nivel = String(detail.nivelDePoder)
        self.nivel.text = nivel
    }
  }
}
