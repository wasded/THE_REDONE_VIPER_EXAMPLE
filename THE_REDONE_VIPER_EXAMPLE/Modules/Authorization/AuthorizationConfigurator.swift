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
        let credentialStorage = DefaultAuthorizationCredentialStorage()
        let sessionManager = DefaultSessionManager()
        let validator = DefaultValidator()
        
        let view = AuthorizationView.instantiate()
        let presenter = AuthorizationPresenter(view: view)
        let interactor = AuthorizationInteractor(presenter: presenter,
                                                 credentialStorage: credentialStorage,
                                                 sessionManager: sessionManager,
                                                 validator: validator)
        
        view.presenter = presenter
        presenter.interactor = interactor
        
        return view
    }
}
