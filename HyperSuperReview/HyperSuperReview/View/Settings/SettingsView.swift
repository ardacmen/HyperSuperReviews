//
//  OnboardingView.swift
//  astrologyToday
//
//  Created by Arda Çimen on 15.03.2023.
//

import UIKit

class SettingsView: UIView {
    
    
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
    
    
    
    // LİNE ONE
    // LİNE ONE
    // LİNE ONE
    // LİNE ONE
    
    lazy var requestStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        requestImageView,
                                        requestLabel
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .black
        stack.isLayoutMarginsRelativeArrangement = true
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 15
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.white.cgColor
        
        return stack
    }()
    
    let requestImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName:
                                    "square.and.pencil")?.withTintColor(.white, renderingMode: .alwaysOriginal).withAlignmentRectInsets(UIEdgeInsets(top: -15, left: -25, bottom: -0,
                                                                                                                                                  right: -25))
        return imageView
        
    }()
    
    
    let requestLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "request film review"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var profileStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        profileImageView,
                                        profileLabel
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .black
        stack.isLayoutMarginsRelativeArrangement = true
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 15
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.white.cgColor
        return stack
    }()
    
    let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")?.withTintColor(.white, renderingMode: .alwaysOriginal).withAlignmentRectInsets(UIEdgeInsets(top: -15, left: -25, bottom: -0,
                                                                                                                                                    right: -25))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    
    let profileLabel : UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    
    
    
    lazy var lineOne: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        requestStack,
                                        profileStack
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 25
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    
    // LİNE TWO
    // LİNE TWO
    // LİNE TWO
    // LİNE TWO
    
   
    lazy var  commentsStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        commentsImageView,
                                        commentsLabel
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .black
        stack.isLayoutMarginsRelativeArrangement = true
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 15
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.white.cgColor
        return stack
    }()
    
    let commentsImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "message")?.withTintColor(.white, renderingMode: .alwaysOriginal).withAlignmentRectInsets(UIEdgeInsets(top: -15, left: -25, bottom: -0,
                                                                                               right: -25))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    
    let commentsLabel : UILabel = {
        let label = UILabel()
        label.text = "Comments"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
 
    
    let MyFriendsImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.3")?.withTintColor(.white, renderingMode: .alwaysOriginal).withAlignmentRectInsets(UIEdgeInsets(top: -15, left: -25, bottom: -0,
                                                                                               right: -25))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    
    let MyFriendsLabel : UILabel = {
        let label = UILabel()
        label.text = "Friends"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var  MyFriendsStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                    MyFriendsImageView,
                                     MyFriendsLabel
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .black
        stack.isLayoutMarginsRelativeArrangement = true
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 15
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.white.cgColor
        return stack
    }()
    
    lazy var lineTwo: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                     //   commentsStack,
                                    //    MyFriendsStackView
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 25
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
   
    // LİNE THREE
    // LİNE THREE
    // LİNE THREE
    // LİNE THREE
    // LİNE THREE
    
    
    
    
    lazy var  logoutStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        logoutImageView,
                                        logoutLabel
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .black
        stack.isLayoutMarginsRelativeArrangement = true
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 15
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.white.cgColor
        return stack
    }()
    
    let logoutImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "return.left")?.withTintColor(.white, renderingMode: .alwaysOriginal).withAlignmentRectInsets(UIEdgeInsets(top: -15, left: -25, bottom: -0,
                                                                                               right: -25))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    
    let logoutLabel : UILabel = {
        let label = UILabel()
        label.text = "logout"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
 
    
    let myReviewsImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "book")?.withTintColor(.white, renderingMode: .alwaysOriginal).withAlignmentRectInsets(UIEdgeInsets(top: -15, left: -25, bottom: -0,
                                                                                               right: -25))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    
    let myReviewsLabel : UILabel = {
        let label = UILabel()
        label.text = "My Reviews"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var  myReviewsStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                    myReviewsImageView,
                                     myReviewsLabel
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .black
        stack.isLayoutMarginsRelativeArrangement = true
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 15
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.white.cgColor
        return stack
    }()
    
    lazy var lineThree: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        logoutStack,
                                        myReviewsStack
                                    ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 25
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        lineOne,
                                //        lineTwo,
                                        lineThree
                                    ])
        stack.spacing = 25
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
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
        
        let widthSize = (UIScreen.main.bounds.width - 125) / 2
        padding.top =  50
        padding.left = 50
        padding.bottom = 16
        padding.right = 50
        
        
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
            
           
            profileStack.heightAnchor.constraint(equalToConstant: widthSize + 30),
            requestStack.heightAnchor.constraint(equalToConstant: widthSize + 30),
            logoutStack.heightAnchor.constraint(equalToConstant: widthSize + 30),
            MyFriendsStackView.heightAnchor.constraint(equalToConstant: widthSize + 30),
            commentsStack.heightAnchor.constraint(equalToConstant: widthSize + 30),
            myReviewsStack.heightAnchor.constraint(equalToConstant: widthSize + 30)
            
            
        ])
        
        
        
        
        
        
    }
    
    
    
    
    
    
}







