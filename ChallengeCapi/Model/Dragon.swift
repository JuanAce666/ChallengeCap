//
//  Dragon.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 15/04/24.
//

import UIKit

class Character {
    var nombre: String = ""
    var nivelDePoder: Int = 0
    var description: String = ""
    var imagenUrl: String = ""
    var id: Int = 0

    // Constructor para inicializar un Character desde un CharacterDTO
    init(dto: DragonWS.CharacterDTO) {
        self.nombre = dto.nombre ?? "--"
        self.nivelDePoder = dto.nivelDePoder ?? 0
        self.description = dto.description ?? "--"
        self.imagenUrl = dto.imagenUrl ?? ""
        self.id = dto.id ?? 0
    }
}

extension Array where Element == DragonWS.CharacterDTO {
    var toCharacter: [Character] {
        self.map { Character(dto: $0) }
    }
}
