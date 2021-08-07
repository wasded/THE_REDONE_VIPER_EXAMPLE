//
//  DashboardInteractor.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 06.08.2021.
//

import Foundation

class DashboardInteractor {
    // MARK: - Properties
    weak var presenter: DashboardPresenterOutputProtocol!
    
    // MARK: - Inits
    init(presenter: DashboardPresenterOutputProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
}

// MARK: - DashboardInteractorProtocol
extension DashboardInteractor: DashboardInteractorProtocol {
}
