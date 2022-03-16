//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юлия on 16.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
