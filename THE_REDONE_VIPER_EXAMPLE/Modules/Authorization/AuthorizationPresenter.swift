//
//  AuthorizationInteractor.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 07.08.2021.
//

import Foundation

class AuthorizationPresenter {
    // MARK: - Properties
    var interactor: AuthorizationInteractorProtocol!
    var router: AuthorizationRouterProtocol!
    weak var view: AuthorizationViewProtocol!
    
    var passwordInput: String
    var loginInput: String
    
    var passwordStateOutput: AuthorizationTextFieldState {
        didSet {
            self.checkAuthorizationButtonIsEnabled()
        }
    }
    var loginStateOutput: AuthorizationTextFieldState {
        didSet {
            self.checkAuthorizationButtonIsEnabled()
        }
    }

    // MARK: - Inits
    init(view: AuthorizationViewProtocol) {
        self.view = view
        
        self.passwordStateOutput = .empty
        self.loginStateOutput = .empty
        self.passwordInput = ""
        self.loginInput = ""
    }
    
    // MARK: - Methods
    func checkAuthorizationButtonIsEnabled() {
        let isEnabled: Bool
        if self.passwordStateOutput == .valid, self.loginStateOutput == .valid {
            isEnabled = true
        } else {
            isEnabled = false
        }
        
        self.view.setButtonState(isEnabled: isEnabled)
    }
}

// MARK: - AuthorizationPresenterInputProtocol
extension AuthorizationPresenter: AuthorizationPresenterInputProtocol {
    func viewDidLoad() {
        self.interactor.fetchStoredData()
    }
    
    func viewWillAppear() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() { }
    
    func viewDidDisappear() { }
    
    func passwordInputDidChanged(_ password: String) {
        self.passwordInput = password
        
        self.interactor.passwordDidChanged(password)
        
        self.view.setPassword(password)
    }
    
    func loginInputDidChanged(_ login: String) {
        self.loginInput = login
        
        self.interactor.loginDidChanged(login)
        
        self.view.setLogin(login)
    }
    
    func signInDidTap() {
        self.view.addActivity()
        
        self.interactor.signIn(login: self.loginInput, password: self.passwordInput)
    }
}

// MARK: - AuthorizationPresenterOutputProtocol
extension AuthorizationPresenter: AuthorizationPresenterOutputProtocol {
    func fetchStoredDataFinished(login: String, password: String) {
        self.view.setLogin(login)
        self.view.setPassword(password)
    }
    
    func passwordStateDidChanged(_ state: AuthorizationTextFieldState) {
        self.passwordStateOutput = state
        self.view.setPasswordState(state)
    }
    
    func loginStateDidChanged(_ state: AuthorizationTextFieldState) {
        self.loginStateOutput = state
        self.view.setLoginState(state)
    }
    
    func authorizationDidSuccess(userLogin: String) {
        DispatchQueue.main.async {
            self.view.removeActivity(animated: true)
        }
    }
    
    func authorizationDidFailed(with error: Error) {
        let title = "Ошибка"
        let message = error.localizedDescription
        
        DispatchQueue.main.async {
            self.view.removeActivity(animated: false)
            self.router.showAlert(title: title, message: message)
        }
    }
}
