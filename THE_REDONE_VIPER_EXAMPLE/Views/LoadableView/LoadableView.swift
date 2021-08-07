//
//  LoadableView.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 27.07.2021.
//

import Foundation
import UIKit

protocol LoadableView {
    var isActivityOn: Bool { get }
    
    func addActivity()
    func removeActivity(animated: Bool)
}

extension LoadableView where Self: UIViewController {
    func addActivity() {
        if self.isActivityOn == true {
            return
        }
        let activity = LoadingView.instantiate()
        activity.startLoading()
        
        activity.frame = self.view.frame
        
        UIView.transition(with: self.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.view.addSubview(activity)
            self.view.bringSubviewToFront(activity)
        }, completion: nil)
    }

    var isActivityOn: Bool {
        for subview in self.view.subviews {
            if subview is LoadingView {
                return true
            }
        }
        return false
    }

    func removeActivity(animated: Bool) {
        for subview in self.view.subviews {
            if subview is LoadingView {
                UIView.transition(with: self.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
                    subview.removeFromSuperview()
                }, completion: nil)
            }
        }
    }
}
