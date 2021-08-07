//
//  AuthorizationCredentialStorage.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 28.07.2021.
//

import Foundation

protocol AuthorizationCredentialStorage {
    var password: String? { get }
    var login: String? { get }
    
    func set(login: String)
    func set(password: String)
    func removeAllCredential()
}
