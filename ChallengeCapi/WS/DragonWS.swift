//
//  DragonWS.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 15/04/24.
//

import Alamofire
import UIKit


struct DragonWS {
    let urlString = "https://mocki.io/v1/8b4a13d1-a251-42cd-bc0a-a4b6e59afb5b"
    func fetch(completionHandler: @escaping CompletionHandler)  {
        AF.request(self.urlString, method: .get).response { dataResponse in
            guard let data = dataResponse.data else { return }
            let responseDTO = try? JSONDecoder().decode(CharacterResponseDTO.self, from: data)
            completionHandler(responseDTO?.results ?? [])
        }
    }
}

extension DragonWS {
    typealias CompletionHandler = (_ arrayCharacterDTO: [CharacterDTO]) -> Void
    
    struct CharacterResponseDTO: Decodable {
        let results: [CharacterDTO]?
    }
    struct CharacterDTO: Decodable {

    }
}

