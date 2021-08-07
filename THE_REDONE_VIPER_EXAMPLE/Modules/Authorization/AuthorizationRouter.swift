//
//  AuthorizationRouter.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 07.08.2021.
//

import Foundation
import UIKit

class AuthorizationRouter {
    // MARK: - Properties
    weak var view: Viewable!
    
    // MARK: - Init
    init(view: Viewable) {
        self.view = view
    }
    
    // MARK: - Methods
}

// MARK: - AuthorizationRouterProtocol
extension AuthorizationRouter: AuthorizationRouterProtocol {
    func showDashboardModel(inputModel: DashboardInputModel) {
        let configurator = DashboardConfigurator()
        
        let viewController = configurator.configure(inputModel: inputModel)
        
        self.view.set([viewController], animated: true)
    }
    
    func showAlert(title: String?, message: String?, actions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message,
                                                preferredStyle: .alert)

        actions.forEach { action in
            alertController.addAction(action)
        }
        
        self.view.present(alertController, animated: true)
    }
}
