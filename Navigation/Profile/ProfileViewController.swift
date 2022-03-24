//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юлия on 16.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.viewWillLayoutSubviews()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray3
    }
    
      override func viewWillLayoutSubviews() {
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.newButton)
        
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
          
          let leadingButtonConstraint = self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
          let trailingButtonConstraint = self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
          let bottomButtonConstraint = self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
          let heightButtomConstraint = self.newButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint, leadingButtonConstraint, trailingButtonConstraint, bottomButtonConstraint, heightButtomConstraint].compactMap({ $0 }))
    }
    
}
