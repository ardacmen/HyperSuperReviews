//
//  OnboardingView.swift
//  astrologyToday
//
//  Created by Arda Çimen on 15.03.2023.
//

import UIKit
import FirebaseStorage

class ProfileView : UIView {
    
    
    init(){
        super.init(frame: .zero)
        setup()
        setupSubviews()
        layoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup()
    {
        backgroundColor =  .black
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "person")
        return view
    }()
    
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
            string: " E-Mail ",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .white
        return tf
    }()
    
    
    lazy var emailStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        emailLabel,
                                        emailTextField
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
            string: " Name ",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .white
        return tf
    }()
    
    
    lazy var nameStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        nameLabel,
                                        nameTextField
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    
    
    let deleteButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Delete Account", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let changePassword : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Change Password", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let saveButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    
    
    lazy var buttonsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        deleteButton,
                                        changePassword,
                                        saveButton
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var imageViewStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        imageView,
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        imageViewStack,
                                        emailStack,
                                        nameStack,
                                        buttonsStack,
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private func setupSubviews()
    {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainVStackView)
    }
    
    
    
    private  func  layoutConstraint() {
        
        var padding: UIEdgeInsets = .zero
        
        
        padding.top =  64
        padding.left = 16
        padding.bottom = 16
        padding.right = 16
        
        
        NSLayoutConstraint.activate([
            
            
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0),
            
            mainVStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: padding.left),
            mainVStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right),
            mainVStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding.top),
            mainVStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding.bottom),
            
            
            
            emailStack.heightAnchor.constraint(equalToConstant: 50.0),
            deleteButton.heightAnchor.constraint(equalToConstant: 50.0),
            changePassword.heightAnchor.constraint(equalToConstant: 50.0),
            saveButton.heightAnchor.constraint(equalToConstant: 50.0),
            nameStack.heightAnchor.constraint(equalToConstant: 50.0),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            imageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            
        ])
    }
}








