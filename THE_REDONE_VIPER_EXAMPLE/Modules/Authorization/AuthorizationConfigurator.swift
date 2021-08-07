//
//  AuthorizationConfigurator.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 07.08.2021.
//

import Foundation
import UIKit

class AuthorizationConfigurator {
    // MARK: - Properties
    
    // MARK: - Inits
    init() { }
    
    // MARK: - Methods
}

// MARK: - AuthorizationConfiguratorProtocol
extension AuthorizationConfigurator: AuthorizationConfiguratorProtocol {
    func configure() -> UIViewController {
        let view = AuthorizationView.instantiate()
        
        return view
    }
}
