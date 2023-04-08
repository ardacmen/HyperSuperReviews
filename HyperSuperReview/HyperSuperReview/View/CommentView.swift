//
//  OnboardingView.swift
//  astrologyToday
//
//  Created by Arda Çimen on 15.03.2023.
//

import UIKit

class CommentView: UIView {
    
    
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
    
    
    let titleLabel : UILabel =
    {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textView : UITextView =
    {
        let tw = UITextView()
        tw.backgroundColor = UIColor.black
        tw.textColor = .white
        tw.translatesAutoresizingMaskIntoConstraints = false
        tw.text = "..."
        tw.clipsToBounds = true
        tw.layer.cornerRadius = 10
        tw.layer.borderWidth  = 0.25
        tw.layer.borderColor = UIColor.white.cgColor
        return tw
    }()
    
    let saveButton : UIButton =
    {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let star1: StarButton = {
        let button = StarButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let star2: StarButton = {
        let button = StarButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let star3: StarButton = {
        let button = StarButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let star4: StarButton = {
        let button = StarButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let star5: StarButton = {
        let button = StarButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var starStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
        star1,
        star2,
        star3,
        star4,
        star5
        ])
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                      titleLabel,
                                      textView,
                                      saveButton,
                                      starStackView
                                    ])
        stack.spacing = 32
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
        padding.bottom = 32
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
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            textView.heightAnchor.constraint(equalToConstant: 400),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            star1.heightAnchor.constraint(equalToConstant: 70),
            star2.heightAnchor.constraint(equalToConstant: 70),
            star3.heightAnchor.constraint(equalToConstant: 70),
            star4.heightAnchor.constraint(equalToConstant: 70),
            star5.heightAnchor.constraint(equalToConstant: 70),
            
        ])
    }
}


