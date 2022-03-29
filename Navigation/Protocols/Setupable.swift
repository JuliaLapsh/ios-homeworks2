//
//  Setupable.swift
//  Navigation
//
//  Created by Юлия on 28.03.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
