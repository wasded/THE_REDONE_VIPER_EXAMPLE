//
//  File.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 07.08.2021.
//

import Foundation


enum AuthorizationTextFieldState {
    case valid
    case invalid
    case empty
}

// MARK: - Equatable
extension AuthorizationTextFieldState: Equatable { }

// MARK: - CaseIterable
extension AuthorizationTextFieldState: CaseIterable { }
