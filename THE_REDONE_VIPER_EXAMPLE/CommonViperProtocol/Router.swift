//
//  Router.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 28.07.2021.
//

import Foundation
import UIKit

protocol Router: AnyObject {
    func showAlert(title: String?, message: String?)
    func showAlert(title: String?, message: String?, actions: [UIAlertAction])
}

extension Router {
    func showAlert(title: String?, message: String?) {
        let action = UIAlertAction(title: "OK", style: .default)
        
        self.showAlert(title: title, message: message, actions: [action])
    }
    
    func showAlert(title: String?, message: String?, actions: [UIAlertAction]) { }
}
