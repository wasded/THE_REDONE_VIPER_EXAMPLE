//
//  DefaultAuthorizationCredentialStorage.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 28.07.2021.
//

import Foundation

class DefaultAuthorizationCredentialStorage {
    // MARK: - Properties
    static let kStoredLogin: String = "stored_login"
    static let kStoredPassword: String = "stored_password"
    
    var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    // MARK: - Inits
    init() { }
    
    // MARK: - Methods
}

// MARK: - CredentialStorage
extension DefaultAuthorizationCredentialStorage: AuthorizationCredentialStorage {
    var password: String? {
        return self.userDefaults.string(forKey: Self.kStoredPassword)
    }
    
    var login: String? {
        return self.userDefaults.string(forKey: Self.kStoredLogin)
    }
    
    func set(login: String) {
        self.userDefaults.set(login, forKey: Self.kStoredLogin)
    }
    
    func set(password: String) {
        self.userDefaults.set(password, forKey: Self.kStoredPassword)
    }
    
    func removeAllCredential() {
        self.userDefaults.set(nil, forKey: Self.kStoredPassword)
        self.userDefaults.set(nil, forKey: Self.kStoredLogin)
    }
    
}
