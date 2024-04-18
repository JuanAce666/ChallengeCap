//
//  SearchCharacterByInfoAdapter.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit

class SearchCharacterByInfoAdapter: NSObject, SearchCharacterAdapterProtocol {
   // var datasource: [Movie] = []
    private var didFilter: ((_ result: [Any]) -> Void)?
    
    func setSearchBar(_ searchBar: UISearchBar) {
  //      searchBar.delegate = self
    }
    
    func didFilterHandler(_ handler: @escaping ([Any]) -> Void) {
        self.didFilter = handler
    }
    
    
}
