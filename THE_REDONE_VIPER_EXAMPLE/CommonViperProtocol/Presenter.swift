//
//  Presenter.swift
//  THE_REDONE_VIPER_EXAMPLE
//
//  Created by Andrey Baskirtcev on 28.07.2021.
//

import Foundation

protocol Presenter: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}
