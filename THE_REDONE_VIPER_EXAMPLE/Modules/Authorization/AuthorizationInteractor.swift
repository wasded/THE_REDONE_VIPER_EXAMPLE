//
//  AuthorizationInteractor.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 07.08.2021.
//

import Foundation

class AuthorizationInteractor {
    // MARK: - Properties
    weak var presenter: AuthorizationPresenterOutputProtocol!
    
    let validator: Validator
    let credentialStorage: AuthorizationCredentialStorage
    let sessionManager: SessionManager
    
    let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
    let loginRegex = "^[a-zA-Z]{4,}+$"
    
    // MARK: Inits
    init(presenter: AuthorizationPresenterOutputProtocol,
         credentialStorage: AuthorizationCredentialStorage,
         sessionManager: SessionManager,
         validator: Validator) {
        self.presenter = presenter
        self.credentialStorage = credentialStorage
        self.sessionManager = sessionManager
        self.validator = validator
    }
    
    // MARK: - Methods
    func validatePasswordAndNotifyPresenter(_ password: String) {
        let state: AuthorizationTextFieldState
        
        if password.isEmpty {
            state = .empty
        } else {
            let isValid = self.validator.validate(regex: self.passwordRegex, value: password)
            state = isValid ? .valid : .invalid
        }
        
        self.presenter.passwordStateDidChanged(state)
    }
    
    func validateLoginAndNotifyPresenter(_ login: String) {
        let state: AuthorizationTextFieldState
        
        if login.isEmpty {
            state = .empty
        } else {
            let isValid = self.validator.validate(regex: self.loginRegex, value: login)
            state = isValid ? .valid : .invalid
        }
        
        self.presenter.loginStateDidChanged(state)
    }
}

// MARK: - AuthorizationInteractorProtocol
extension AuthorizationInteractor: AuthorizationInteractorProtocol {
    func fetchStoredData() {
        let password = self.credentialStorage.password ?? ""
        let login = self.credentialStorage.login ?? ""
        
        self.presenter.fetchStoredDataFinished(login: login, password: password)
        
        self.validatePasswordAndNotifyPresenter(password)
        self.validateLoginAndNotifyPresenter(login)
    }
    
    func passwordDidChanged(_ password: String) {
        self.credentialStorage.set(password: password)
        
        self.validatePasswordAndNotifyPresenter(password)
    }
    
    func loginDidChanged(_ login: String) {
        self.credentialStorage.set(login: login)
        
        self.validateLoginAndNotifyPresenter(login)
    }
    
    func signIn(login: String, password: String) {
        self.sessionManager.signIn(login: login,
                                   password: password) { result in
            switch result {
            case .success:
                self.credentialStorage.removeAllCredential()
                self.presenter.authorizationDidSuccess(userLogin: login)
            case .failure(let error):
                self.presenter.authorizationDidFailed(with: error)
            }
        }
    }
}
