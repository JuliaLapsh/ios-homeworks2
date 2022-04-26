//
//  InfoViewController.swift
//  Navigation
//
//  Created by Юлия on 16.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.setTitle("Показать алерт", for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        self.view.addSubview(alertButton)
        self.setupButton()
    }
    
    private func setupButton() {
        alertButton.addTarget(self, action: #selector(didTapInfo), for: .touchUpInside)
        self.alertButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 80).isActive = true
        self.alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80).isActive = true
        self.alertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func didTapInfo() {
        
        let alert = UIAlertController(title: "Внимание, что-то важное", message: "Сообщение всплывающего окна", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: { action in
            print("tapped Cancel")})
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            print("tapped OK")})
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true)

    }
}
