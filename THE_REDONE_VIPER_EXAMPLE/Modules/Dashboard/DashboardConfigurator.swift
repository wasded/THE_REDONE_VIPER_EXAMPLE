//
//  DashboardConfigurator.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 06.08.2021.
//

import Foundation
import UIKit

class DashboardConfigurator {
    // MARK: - Properties
    
    // MARK: - Inits
    init() { }
    
    // MARK: - Methods
}

// MARK: - DashboardConfiguratorProtocol
extension DashboardConfigurator: DashboardConfiguratorProtocol {
    func configure(inputModel: DashboardInputModel) -> UIViewController {
        let view = DashboardView.instantiate()
        let presenter = DashboardPresenter(view: view, inputModel: inputModel)
        let interactor = DashboardInteractor(presenter: presenter)
        let router = DashboardRouter(view: view)
        
        presenter.interactor = interactor
        presenter.router = router
        view.presenter = presenter
        
        return view
    }
}
