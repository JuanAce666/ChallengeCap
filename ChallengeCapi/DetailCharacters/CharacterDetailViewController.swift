//
//  CharacterDetailViewController.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 22/04/24.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var detailView: CharacterDetailView? { self.view as? CharacterDetailView }
    lazy var webService = DragonWS()
    lazy var webDetail = DragonWS()
    var character: Character?
    var characterId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacterDetails()
    }
    
    private func getCharacterDetails() {
        // Verificar si `characterId` no es nulo
        guard let characterId = characterId else { return }
        
        // Llamar al servicio web para obtener detalles del personaje
        webDetail.fetch(idCharacter: characterId) { [weak self] characterDTOs in
            guard let strongSelf = self else { return } // Referencia débil para evitar fugas de memoria
            
            // Verificar que el resultado tenga al menos un elemento
            guard let firstCharacterDTO = characterDTOs.first else {
                print("Error: No se encontraron personajes con el ID proporcionado")
                return
            }

            // Crear un objeto `Character` a partir del primer `CharacterDTO`
            let detail = Character(dto: firstCharacterDTO)

            // Asegurarse de que la actualización de la interfaz de usuario se realice en el hilo principal
            DispatchQueue.main.async {
                strongSelf.detailView?.dataInjection(fromModel: detail) // Actualizar la vista con el detalle del personaje
            }
        }
    }

}
