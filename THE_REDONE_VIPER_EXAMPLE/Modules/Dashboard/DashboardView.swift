//
//  DashboardView.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 29.07.2021.
//

import Foundation
import UIKit

class DashboardView: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var helloLabel: UILabel!
    
    // MARK: - Properties
    var presenter: DashboardPresenterInputProtocol!
    
    // MARK: - Instantiate
    static func instantiate() -> DashboardView {
        let viewController = UIStoryboard.dashboardStoryboard.instantiate(type: Self.self)
        
        return viewController
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureInterface()
        
        self.presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.presenter.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.presenter.viewDidDisappear()
    }
    
    // MARK: - Actions
    
    // MARK: - Methods
    func configureInterface() {
        self.title = "Дашборд"
    }
}

// MARK: - DashboardViewProtocol
extension DashboardView: DashboardViewProtocol {
    func setHelloText(_ text: String) {
        self.helloLabel.text = text
    }
}
