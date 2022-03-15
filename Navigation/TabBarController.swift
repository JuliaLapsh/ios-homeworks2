//
//  TabBarController.swift
//  Navigation
//
//  Created by Юлия on 13.03.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    private enum TabBarItem {
        case feed
        case profile
        
        var title: String {
            switch self {
            case .feed:
                return "Лента"
            case .profile:
                return "Профиль"
            }
        }

      var image: UIImage? {
            switch self {
            case .feed:
                return UIImage(systemName: "house")
            case .profile:
                return UIImage(systemName: "person.circle")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }
    
    func setupTabBar() {
        let items: [TabBarItem] = [.feed, .profile]
        
        self.viewControllers = items.map({ tabBarItem in
            switch tabBarItem {
            case .feed:
                let FeedViewController = FeedViewController()
                return UINavigationController(rootViewController: FeedViewController)
            case .profile:
                let ProfileViewController = ProfileViewController()
                return UINavigationController(rootViewController: ProfileViewController)
            }
        })
        self.viewControllers?.enumerated().forEach({ (index, vc) in
            vc.tabBarItem.title = items[index].title
        })
        self.viewControllers?.enumerated().forEach({ (index, vc) in
            vc.tabBarItem.image = items[index].image
        })
    }
}

class FeedViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.layer.cornerRadius = 12
        button.setTitle("Перейти на пост", for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        button.addTarget(self,
                         action: #selector(didTapButton),
                         for: .touchUpInside)
        self.navigationItem.title = "Лента"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func didTapButton() {
        //Create and present tab bar controller
        let tabBarVC = UITabBarController()
        
        let vc3 = UINavigationController(rootViewController: PostViewController())
        tabBarVC.setViewControllers([vc3], animated: false)
        
        present(tabBarVC, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
}

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        self.navigationItem.title = "Мой пост"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let infoBarButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(tappedInfo))
        navigationItem.rightBarButtonItem = infoBarButton
    }
    
    @objc func tappedInfo() {
        let info = UITabBarController()
        let vc4 = UINavigationController(rootViewController: InfoViewController())
        info.setViewControllers([vc4], animated: false)
        present(info, animated: true)
    }
}

class InfoViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.layer.cornerRadius = 12
        button.setTitle("Показать алерт", for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        self.navigationItem.title = "Информация"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(button)
        button.addTarget(self,
                         action: #selector(infoTap),
                         for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func infoTap() {
        
        let actionSheet = UIAlertController(title: "Внимание, что-то важное", message: "Какое-то сообщение всплывающего окна", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { action in
            print("tapped Cancel")
        }))
        actionSheet.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print("tapped OK")
        }))
        present(actionSheet, animated: true)

    }
}
/*
    func showAlert() {
        let alert = UIAlertController(title: "Внимание, что-то важное", message: "Какое-то сообщение всплывающего окна", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { action in
            print("tapped dismiss")
        }))
        
        present(alert, animated: true)
    }
    
    func showActionsheet(){
        let actionSheet = UIAlertController(title: "Внимание, что-то важное", message: "Какое-то сообщение всплывающего окна", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { action in
            print("tapped dismiss")
        }))
        actionSheet.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print("tapped OK")
        }))
        present(actionSheet, animated: true)
    }
    */

