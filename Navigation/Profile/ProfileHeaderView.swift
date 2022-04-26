//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юлия on 20.03.2022.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "hamilton_the_cat"))
        imageView.layer.cornerRadius = 65
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var verticalStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var name: UILabel = {
        
        let name = UILabel()
        name.text = "Hipster Cat"
        name.textColor = .black
        name.font = UIFont(name: "Helvetica-Bold", size: 18)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        return name
    }()
    
    private lazy var status: UILabel = {
        
        let status = UILabel()
        status.text = "Waiting for something..."
        status.textColor = .gray
        status.font = UIFont(name: "Helvetica-Bold", size: 14)
        status.translatesAutoresizingMaskIntoConstraints = false
        
        return status
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите статус"
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Helvetica-Regular", size: 15)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(didTapStatusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        
        self.addSubview(horizontalStackView)
        self.addSubview(setStatusButton)
        self.addSubview(textField)
        self.horizontalStackView.addArrangedSubview(avatar)
        self.horizontalStackView.addArrangedSubview(verticalStackView)
        self.verticalStackView.addArrangedSubview(name)
        self.verticalStackView.addArrangedSubview(status)
        self.textField.delegate = self
 
        let horStackViewTopConstraint = self.horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let horStackViewLeadingConstraint = self.horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let horStackViewTrailingConstraint = self.horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        let avatarImageViewWidthConstraint = self.avatar.widthAnchor.constraint(equalToConstant: 138)
        let avatarImageViewHeightConstraint = self.avatar.heightAnchor.constraint(equalToConstant: 138)
        
        let buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 16)
        let buttonLeadingConstarint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let buttonTrailingConstarint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let buttonHeightConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        let buttonBottomConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        
        let topTextFieldConstraint = self.textField.topAnchor.constraint(equalTo: self.horizontalStackView.bottomAnchor, constant: -10)
        let leadingTextFieldConstraint = self.textField.leadingAnchor.constraint(equalTo: self.verticalStackView.leadingAnchor)
        let heightTextFieldConstraint = self.textField.heightAnchor.constraint(equalToConstant: 40)
        let trailingTextFieldConstraint = self.textField.trailingAnchor.constraint(equalTo: self.verticalStackView.trailingAnchor)

        NSLayoutConstraint.activate([ horStackViewTopConstraint, horStackViewLeadingConstraint, horStackViewTrailingConstraint, avatarImageViewWidthConstraint, avatarImageViewHeightConstraint, buttonTopConstraint, buttonLeadingConstarint, buttonTrailingConstarint, buttonHeightConstraint, buttonBottomConstraint, topTextFieldConstraint, leadingTextFieldConstraint, heightTextFieldConstraint, trailingTextFieldConstraint ])
    }
    
    private var statusText: String? = nil
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }

    @objc func didTapStatusButton() {
        guard textField.text != "" else {
            textField.vibrate()
            return
        }
        statusText = textField.text!
        status.text = "\(statusText ?? "")"
        self.textField.text = nil
        self.endEditing(true)
    }
}

extension UIView {
    func vibrate() {
    let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.05
            animation.repeatCount = 5
            animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5.0, y: self.center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5.0, y: self.center.y))
    layer.add(animation, forKey: "position")
    }
}
