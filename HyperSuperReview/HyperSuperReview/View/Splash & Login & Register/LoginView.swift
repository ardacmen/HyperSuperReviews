//
//  RegisterView.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 5.04.2023.
//

import UIKit

class LoginView: UIView {
    
    
    init(){
        super.init(frame: .zero)
        setup()
        setupSubviews()
        layoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .black
    }
    
    
    
    // MARK: - Properties
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Welcome 👋\nHyperSuperReview"
        return label
    }()
    
   
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Email"
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your email"
        textField.setLeftPaddingPoints(20)
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 22
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        label.text = "Password"
        label.textAlignment = .left
        return label
    }()
    
    let forgotButton: UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTitleColor(.red, for: .normal)
        label.contentHorizontalAlignment = .right
        label.setTitle("Forgot Password?", for: .normal)
        label.titleLabel?.font = .systemFont(ofSize: 13)
        return label
    }()
    
    lazy var forgotButtonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        forgotButton
                                    ])
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your password"
        textField.borderStyle = .roundedRect
        textField.setLeftPaddingPoints(20)
        textField.backgroundColor = .white
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 22
        textField.isSecureTextEntry = true
        textField.textColor = .black
        return textField
    }()
    
    let LoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = UIColor(red: 0.22, green: 0.50, blue: 0.72, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    
    
    
  
    lazy var passwordStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [passwordLabel,passwordTextField])
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var emailStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var loginButtonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [LoginButton])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    let labelledDivider : UIView = {
        let view = UIView(label: "OR", leftLine: true, rightLine: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    lazy var seperatorStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        labelledDivider
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var titleStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        titleLabel
                                    ])
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleStack,emailStack ,passwordStack , seperatorStack ,forgotButtonStack,loginButtonStack])
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private func setupSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainVStackView)
    }
    
    private  func  layoutConstraint() {
        
        var padding: UIEdgeInsets = .zero
        
        
        padding.top =  64
        padding.left = 0
        padding.bottom = 0
        padding.right = 0
        
        
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
            labelledDivider.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 0 ),
            labelledDivider.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            forgotButton.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 24 ),
            forgotButton.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -24),
           
            passwordLabel.heightAnchor.constraint(equalToConstant: 17),
            emailLabel.heightAnchor.constraint(equalToConstant: 17),
            
          
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            LoginButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 32),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 32),
            labelledDivider.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            LoginButton.topAnchor.constraint(equalTo: labelledDivider.bottomAnchor, constant: 64),
           
            
            emailTextField.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            LoginButton.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            LoginButton.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -48),
            
        ])
        
    }
}
