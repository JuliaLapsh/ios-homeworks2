//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юлия on 20.03.2022.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private lazy var avatar: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hamilton_the_cat")
        imageView.layer.cornerRadius = 45
        imageView.layer.borderWidth = 3.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFit
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
        stackView.spacing = 10
        
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
    
    private lazy var setStatusButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private func drawSelf() {
        self.backgroundColor = .systemGray3
        
        self.addSubview(horizontalStackView)
        self.addSubview(setStatusButton)
        self.horizontalStackView.addArrangedSubview(avatar)
        self.horizontalStackView.addArrangedSubview(verticalStackView)
        self.verticalStackView.addArrangedSubview(name)
        self.verticalStackView.addArrangedSubview(status)
 
        let horStackViewTopConstraint = self.horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let horStackViewLeadingConstraint = self.horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let horStackViewTrailingConstraint = self.horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        let avatarRatioConstraint = self.avatar.heightAnchor.constraint(equalTo: self.avatar.widthAnchor, multiplier: 1.0)
        
        let buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.horizontalStackView.bottomAnchor, constant: 16)
        buttonTopConstraint.priority = UILayoutPriority(rawValue: 999)
        let buttonLeadingConstarint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let buttonTrailingConstarint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let buttonHeightConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        let buttonBottomConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        NSLayoutConstraint.activate([horStackViewTopConstraint, horStackViewLeadingConstraint, horStackViewTrailingConstraint, avatarRatioConstraint, buttonTopConstraint, buttonLeadingConstarint, buttonTrailingConstarint, buttonHeightConstraint, buttonBottomConstraint].compactMap( {$0} ))
  
    }
    
    @objc func buttonPressed() {
        let statusText = self.status.text
        if statusText != nil{
            print(statusText!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
