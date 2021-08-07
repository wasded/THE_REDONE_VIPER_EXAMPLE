//
//  UIStoryboard+AdditionalsInstantiate.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 07.08.2021.
//

import Foundation
import UIKit

extension UIStoryboard {
    func instantiate<T: UIViewController>(type: T.Type) -> T {
        return self.instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}
