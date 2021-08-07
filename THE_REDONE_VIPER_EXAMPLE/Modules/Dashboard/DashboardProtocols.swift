//
//  DashboardProtocols.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 29.07.2021.
//

import Foundation
import UIKit

protocol DashboardViewProtocol: Viewable {
    func setHelloText(_ text: String)
}

protocol DashboardPresenterOutputProtocol: AnyObject {
}

protocol DashboardPresenterInputProtocol: Presenter {
    
}

protocol DashboardInteractorProtocol: AnyObject {
}

protocol DashboardRouterProtocol: Router {
    
}

protocol DashboardConfiguratorProtocol: AnyObject {
    func configure(inputModel: DashboardInputModel) -> UIViewController
}
