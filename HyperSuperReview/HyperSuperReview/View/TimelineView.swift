//
//  OnboardingView.swift
//  astrologyToday
//
//  Created by Arda Çimen on 15.03.2023.
//

import UIKit

class TimelineView: UIView {
    
    
    
    
    init(){
        super.init(frame: .zero)
        setup()
        setupSubviews()
        layoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let reviewCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width - 52, height:  200)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 50, right: 10)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.backgroundColor = .black
        collectionView.register(ReviewCV.self, forCellWithReuseIdentifier: ReviewCV.identifier)
        return collectionView
    }()
    
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
    
    
    
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        reviewCollectionView
                                    ])
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private func setupSubviews()
    {
        addSubview(contentView)
        contentView.addSubview(mainVStackView)
    }
    
    private func layoutConstraint() {
        
        var padding: UIEdgeInsets = .zero
        
        padding.top = 16
        padding.left = 16
        padding.bottom = 16
        padding.right = 16
        
        NSLayoutConstraint.activate([
            
           
            
            contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            contentView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: 0),
            
            mainVStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: padding.left),
            mainVStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right),
            mainVStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding.top),
            mainVStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding.bottom),
            
        ])
    }

  
}


