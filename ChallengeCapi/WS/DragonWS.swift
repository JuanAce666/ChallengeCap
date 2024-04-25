//
//  DragonWS.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 15/04/24.
//

import Alamofire
import UIKit


struct DragonWS {
    let urlString = "https://34f8409486bf45f7820f71e8f9987cf5.api.mockbin.io/"
    func fetch(completionHandler: @escaping CompletionHandler)  {
        AF.request(self.urlString, method: .get).response { dataResponse in
            guard let data = dataResponse.data else { return }
            let responseDTO = try? JSONDecoder().decode(CharacterResponseDTO.self, from: data)
            completionHandler(responseDTO?.results ?? [])
        }
    }
}

//MARK: - Cloruses - and DTO
extension DragonWS {
    typealias CompletionHandler = (_ arrayMoviesDTO: [CharacterDTO]) -> Void
    
    struct CharacterResponseDTO: Decodable {
        let results: [CharacterDTO]?
    }
    
    struct CharacterDTO: Decodable {
        let nombre: String?
        let nivelDePoder: Int?
        let description: String?
        let imagenUrl: String?
    }
}

