//
//  DragonWS.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 15/04/24.
//

import Alamofire
import UIKit


struct DragonWS {
   
    private let baseURL = "https://34f8409486bf45f7820f71e8f9987cf5.api.mockbin.io/"
    
    func fetch(idCharacter: Int, completionHandler: @escaping CompletionHandler) {
        let urlString = "\(baseURL)\(idCharacter)"
        AF.request(urlString, method: .get).response { dataResponse in
            guard let data = dataResponse.data else {
                completionHandler([])
                return
            }
            do {
                let responseDTO = try JSONDecoder().decode(CharacterResponseDTO.self, from: data)
                completionHandler(responseDTO.results ?? [])
            } catch {
                print("Error decoding JSON: \(error)")
                completionHandler([])
            }
        }
    }
}

// MARK: - Closures and DTO
extension DragonWS {
    typealias CompletionHandler = (_ arrayCharacterDTO: [CharacterDTO]) -> Void
    
    struct CharacterResponseDTO: Decodable {
        let results: [CharacterDTO]?
    }
    
    struct CharacterDTO: Decodable {
        let id: Int?
        let nombre: String?
        let nivelDePoder: Int?
        let description: String?
        let imagenUrl: String?
    }
}
