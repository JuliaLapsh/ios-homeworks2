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
        
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
          
        let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 170)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint].compactMap({ $0 }))
     
    }
    
}
