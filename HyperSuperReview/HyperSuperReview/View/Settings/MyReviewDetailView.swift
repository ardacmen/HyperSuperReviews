//
//  OnboardingView.swift
//  astrologyToday
//
//  Created by Arda Çimen on 15.03.2023.
//

import UIKit

class MyReviewDetailView: UIView {
    
    
    
    
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
    
    let title : UILabel =
    {
        var label = UILabel()
        label.font = .systemFont(ofSize: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        return label
    }()
    
    
    
    let date : UILabel =
    {
        var label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let category : UILabel =
    {
        var label = UILabel()
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let imageView : UIImageView =
    {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return  image
    }()
    
    lazy var imageViewStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        imageView
                                    ])
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var titleStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        title
                                    ])
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var dateAndCategory: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        date,
                                        category
                                    ])
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    
    
    let content : UITextView =
    {
        var content = UITextView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = UIColor.black
        content.textColor = .white
        content.font = .systemFont(ofSize: 15)
        content.isUserInteractionEnabled     = false
        
        return content
    }()
    
    
    let userStar : UILabel =
    {
        var label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        return label
    }()
    
    lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        content
                                    ])
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var allContent: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        imageViewStack, content
                                    ])
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        title,dateAndCategory,allContent,userStar
                                    ])
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
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
        
        
        padding.top =  16
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
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0),
            
            mainVStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: padding.left),
            mainVStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right),
            mainVStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding.top),
            mainVStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding.bottom),
            
            title.heightAnchor.constraint(equalToConstant: 28),
            date.heightAnchor.constraint(equalToConstant: 17),
            
            allContent.heightAnchor.constraint(equalToConstant: 550)
            
            
        ])
    }
}



