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
    func showMainModule() {
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
