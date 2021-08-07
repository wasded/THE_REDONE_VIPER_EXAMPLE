//
//  DashboardPresenter.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 06.08.2021.
//

import Foundation

class DashboardPresenter {
    // MARK: - Properties
    var interactor: DashboardInteractorProtocol!
    var router: DashboardRouterProtocol!
    weak var view: DashboardViewProtocol!
    
    let inputModel: DashboardInputModel
    
    // MARK: - Inits
    init(view: DashboardViewProtocol,
         inputModel: DashboardInputModel) {
        self.view = view
        self.inputModel = inputModel
    }
    
    // MARK: - Methods
    func setHelloText() {
        let helloText = String(format: "Привет %@!", self.inputModel.login)
        
        self.view.setHelloText(helloText)
    }
}

// MARK: - DashboardPresenterInputProtocol
extension DashboardPresenter: DashboardPresenterInputProtocol {
    func viewDidLoad() {
        self.setHelloText()
    }
    
    func viewWillAppear() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() { }
    
    func viewDidDisappear() { }
}

// MARK: - DashboardPresenterOutputProtocol
extension DashboardPresenter: DashboardPresenterOutputProtocol {
}
