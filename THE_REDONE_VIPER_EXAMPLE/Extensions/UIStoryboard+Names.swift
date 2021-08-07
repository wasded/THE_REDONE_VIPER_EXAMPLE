//
//  UIStoryboard+Names.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 07.08.2021.
//

import Foundation
import UIKit

extension UIStoryboard {    
    static var authorizationStoryboard: UIStoryboard {
        return UIStoryboard(name: "Authorization", bundle: Bundle.main)
    }
    
    static var dashboardStoryboard: UIStoryboard {
        return UIStoryboard(name: "Dashboard", bundle: Bundle.main)
    }
}
