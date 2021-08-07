//
//  AuthorizationView.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 07.08.2021.
//

import Foundation
import UIKit

class AuthorizationView: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - Properties
    var presenter: AuthorizationPresenterInputProtocol!
    
    // MARK: - Instatiate
    static func instantiate() -> AuthorizationView {
        let viewController = UIStoryboard.authorizationStoryboard.instantiate(type: Self.self)
        
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
    @objc func signInButtonDidTap(_ sender: UIButton) {
        self.presenter.signInDidTap()
    }

    // MARK: - Methods
    private func configureInterface() {
        // self
        self.title = "Авторизация"
        
        // passwordLabel
        self.passwordLabel.text = "Пароль"
        
        // loginTextField
        self.loginTextField.delegate = self
        
        // loginLabel
        self.loginLabel.text = "Логин"
        
        // passwordTextField
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.delegate = self
        
        // signInButton
        self.signInButton.setTitle("Авторизоваться", for: .normal)
        self.signInButton.addTarget(self, action: #selector(self.signInButtonDidTap(_:)), for: .touchUpInside)
    }
}

// MARK: - AuthorizationViewProtocol
extension AuthorizationView: AuthorizationViewProtocol {
    func setPassword(_ password: String) {
        self.passwordTextField.text = password
    }
    
    func setLogin(_ login: String) {
        self.loginTextField.text = login
    }
    
    func setPasswordState(_ state: AuthorizationTextFieldState) {
        switch state {
        case .empty, .valid:
            self.passwordTextField.textColor = .black
        case .invalid:
            self.passwordTextField.textColor = .systemRed
        }
    }
    
    func setLoginState(_ state: AuthorizationTextFieldState) {
        switch state {
        case .empty, .valid:
            self.loginTextField.textColor = .black
        case .invalid:
            self.loginTextField.textColor = .systemRed
        }
    }
    
    func setButtonState(isEnabled: Bool) {
        self.signInButton.isEnabled = isEnabled
    }
}

// MARK: - UITextFieldDelegate
extension AuthorizationView: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let oldText = textField.text,
              let range = Range(range, in: oldText) else { return false }
        
        let newText = oldText.replacingCharacters(in: range, with: string)
        
        if textField === self.loginTextField {
            self.presenter.loginInputDidChanged(newText)
        } else if textField === self.passwordTextField {
            self.presenter.passwordInputDidChanged(newText)
        }
        
        return false
    }
}
