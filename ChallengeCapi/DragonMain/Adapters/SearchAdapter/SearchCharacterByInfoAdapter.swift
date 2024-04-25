//
//  SearchCharacterByInfoAdapter.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit

class SearchCharacterByInfoAdapter: NSObject, SearchCharacterAdapterProtocol {
    var datasource: [Character] = []
    private var didFilter: ((_ result: [Any]) -> Void)?
    
    func setSearchBar(_ searchBar: UISearchBar) {
        searchBar.delegate = self
    }
    
    func didFilterHandler(_ handler: @escaping ([Any]) -> Void) {
        self.didFilter = handler
    }
    
    
}

extension SearchCharacterByInfoAdapter: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var arrayResult: [Any] = []
        let searchTextLowercased = searchText.lowercased()
        
        if searchTextLowercased.isEmpty {
            arrayResult = self.datasource
        }else {
            arrayResult = self.datasource.filter({
                $0.nombre.lowercased().contains(searchText.lowercased())
            })
            arrayResult = !arrayResult.isEmpty ? arrayResult : ["""
            No se encontraron resultados:
            \(searchText)
            """]
            
        }
        self.didFilter?(arrayResult)
    }
}
