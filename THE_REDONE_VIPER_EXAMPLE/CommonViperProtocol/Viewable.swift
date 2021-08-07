//
//  Viewable.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 27.07.2021.
//

import Foundation
import UIKit

protocol Viewable: AnyObject {
    func push(_ vc: UIViewController, animated: Bool)
    func present(_ vc: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func removeAll()
    func set(_ vcs: [UIViewController], animated: Bool)
    func dismiss(animated: Bool)
    func dismiss(animated: Bool, _ completion:  @escaping (() -> Void))
}

extension Viewable where Self: UIViewController {

    func push(_ vc: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }

    func present(_ vc: UIViewController, animated: Bool) {
        self.present(vc, animated: animated, completion: nil)
    }

    func pop(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func removeAll() {
        self.navigationController?.viewControllers.removeAll()
    }
    
    func set(_ vcs: [UIViewController], animated: Bool) {
        self.navigationController?.setViewControllers(vcs, animated: true)
    }

    func dismiss(animated: Bool) {
        self.dismiss(animated: animated, completion: nil)
    }

    func dismiss(animated: Bool, _ completion: @escaping (() -> Void)) {
        self.dismiss(animated: animated, completion: completion)
    }
}
