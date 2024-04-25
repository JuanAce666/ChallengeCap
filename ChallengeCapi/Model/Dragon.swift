//
//  Dragon.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 15/04/24.
//

import Foundation

class Character {
    var nombre: String = ""
    var nivelDePoder: Int = 0
    var description: String = ""
    var imagenUrl: String = ""

    // Constructor para inicializar un Character desde un CharacterDTO
    init(dto: DragonWS.CharacterDTO) {
        self.nombre = dto.nombre ?? "--"
        self.nivelDePoder = dto.nivelDePoder ?? 0
        self.description = dto.description ?? "--"
        self.imagenUrl = dto.imagenUrl ?? ""
    }
}

extension Array where Element == DragonWS.CharacterDTO {
    var toCharacter: [Character] {
        self.map { Character(dto: $0) }
    }
}
