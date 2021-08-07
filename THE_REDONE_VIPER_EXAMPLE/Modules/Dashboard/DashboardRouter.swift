//
//  DashboardRouter.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 06.08.2021.
//

import Foundation

class DashboardRouter {
    // MARK: - Properties
    weak var view: Viewable!
    
    // MARK: - Inits
    init(view: Viewable) {
        self.view = view
    }
    
    // MARK: - Methods
}

// MARK: - DashboardRouterProtocol
extension DashboardRouter: DashboardRouterProtocol {
}
