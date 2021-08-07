//
//  LoadingView.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 27.07.2021.
//

import UIKit

class LoadingView: UIView {
    // MARK: - Outelts
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Instantiate
    class func instantiate() -> LoadingView {
        return UINib(nibName: "LoadingView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)
            .first as! LoadingView
    }
    
    // MARK: - Methods
    func startLoading() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func showError() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
}
