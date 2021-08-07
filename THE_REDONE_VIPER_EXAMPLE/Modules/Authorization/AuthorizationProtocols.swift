//
//  AuthorizationProtocols.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 07.08.2021.
//

import Foundation
import UIKit

protocol AuthorizationConfiguratorProtocol: AnyObject {
    func configure() -> UIViewController
}

protocol AuthorizationViewProtocol: Viewable, LoadableView {
    func setPassword(_ password: String)
    func setLogin(_ login: String)
    func setPasswordState(_ state: AuthorizationTextFieldState)
    func setLoginState(_ state: AuthorizationTextFieldState)
    func setButtonState(isEnabled: Bool)
}

protocol AuthorizationPresenterInputProtocol: Presenter {
    func passwordInputDidChanged(_ password: String)
    func loginInputDidChanged(_ login: String)
    func signInDidTap()
}

protocol AuthorizationPresenterOutputProtocol: AnyObject {
    func passwordStateDidChanged(_ state: AuthorizationTextFieldState)
    func loginStateDidChanged(_ state: AuthorizationTextFieldState)
    func authorizationDidSuccess()
    func authorizationDidFailed(with error: Error)
    func fetchStoredDataFinished(login: String, password: String)
}

protocol AuthorizationInteractorProtocol: AnyObject {
    func passwordDidChanged(_ password: String)
    func loginDidChanged(_ login: String)
    func fetchStoredData()
    func signIn(login: String, password: String)
}

protocol AuthorizationRouterProtocol: Router {
    func showDashboardModel(inputModel: DashboardInputModel)
}
