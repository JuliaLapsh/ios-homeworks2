//
//  PostViewController.swift
//  Navigation
//
//  Created by Юлия on 16.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        
        let infoBarButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(infoBarButton))
        
        self.navigationItem.rightBarButtonItem = infoBarButton
    }
    
    @objc func infoBarButton() {
        let infoVC = InfoViewController()
        infoVC.modalPresentationStyle = .fullScreen
        self.present(infoVC, animated: true)
    }
}
