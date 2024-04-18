//
//  SearchCharacterAdapterProtocol.swift
//  ChallengeCapi
//
//  Created by Juan Felipe Acevedo Ramirez on 16/04/24.
//

import UIKit

protocol SearchCharacterAdapterProtocol: AnyObject {
 //   var datasource: [Movie] {get set}
    func setSearchBar(_ searchBar: UISearchBar)
    func didFilterHandler(_ handler: @escaping (_ result:  [Any]) -> Void)
}
