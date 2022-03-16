//
//  FeedViewController.swift
//  Navigation
//
//  Created by Юлия on 16.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    struct Post {
        var title: String
    }
    
    let post = Post.init(title: "Мой пост")

    let button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.setTitle("Перейти на пост", for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        self.setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Лента"
    }
    
    private func setupButton() {
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        self.button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 80).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func didTapButton() {
        let postVC = PostViewController()
        
        postVC.navigationItem.title = post.title
        self.navigationController?.pushViewController(postVC, animated: true)
    }
}
