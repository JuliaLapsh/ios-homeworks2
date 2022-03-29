//
//  LogInViewController.swift
//  Navigation
//
//  Created by Юлия on 25.03.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setupView()
        self.tapGesture()
        self.nameTextField.delegate = self
        self.passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(LogInViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LogInViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentOffset = CGPoint(x: 0, y: keyboardSize.height * 0.1)
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentOffset = CGPoint.zero
    }
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var textFieldStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        return stackView
    }()
    
    private lazy var nameTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Email or phone"
        textField.font = UIFont.systemFont(ofSize: 16)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.tintColor = .lightGray
        textField.autocapitalizationType = .none
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 16)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.tintColor = .lightGray
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "Color")
        
        if button.isSelected {
            button.alpha = 0.8
        } else if button.isHighlighted {
            button.alpha = 0.8
        } else if !button.isEnabled {
            button.alpha = 0.8
        } else {
            button.alpha = 1
        }
        
        button.addTarget(self, action: #selector(self.didTapLogInButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
         return button
    }()
    
    private func setupView() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        self.scrollView.addSubview(logo)
        self.stackView.addArrangedSubview(textFieldStackView)
        self.stackView.addArrangedSubview(logInButton)
        self.textFieldStackView.addArrangedSubview(nameTextField)
        self.textFieldStackView.addArrangedSubview(passwordTextField)
        
        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let scrollViewRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        let logoCenterConstraint = self.logo.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let logoHeightConstraint = self.logo.heightAnchor.constraint(equalToConstant: 100)
        let logoWidthConstraint = self.logo.widthAnchor.constraint(equalToConstant: 100)
        let logoBottomConstraint = self.logo.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -70)
        
        let stackViewCenterXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let stackViewCenterYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor)
        let stackViewLeadingConstaraint = self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16)
        let stackViewTrailingConstaraint = self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16)
        
        let nameTextFieldHeightConstraint = self.nameTextField.heightAnchor.constraint(equalToConstant: 50)
        let passwordTextFieldHeightConstraint = self.passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        let buttonHeightConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([ scrollViewTopConstraint, scrollViewLeftConstraint, scrollViewRightConstraint, scrollViewBottomConstraint, logoCenterConstraint, logoHeightConstraint, logoWidthConstraint, logoBottomConstraint, stackViewCenterXConstraint, stackViewCenterYConstraint, stackViewLeadingConstaraint, stackViewTrailingConstaraint, nameTextFieldHeightConstraint, passwordTextFieldHeightConstraint, buttonHeightConstraint ])
    
    }
    
    private func tapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing))
        self.view.addGestureRecognizer(tap)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc private func didTapLogInButton() {
        if logInButton.isSelected{
            logInButton.alpha = 0.8
        } else if logInButton.isHighlighted {
            logInButton.alpha = 0.8
        } else if !logInButton.isEnabled {
            logInButton.alpha = 0.8
        } else {
            logInButton.alpha = 1
        }
        
        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
        }
    
}
    

