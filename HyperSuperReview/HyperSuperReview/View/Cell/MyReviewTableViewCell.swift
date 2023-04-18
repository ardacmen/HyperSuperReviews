//
//  MyReviewTableViewCell.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 18.04.2023.
//

import UIKit

class MyReviewTableViewCell: UITableViewCell {
    
    
    static let identifier = "MyReviewTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }()
    
    lazy var titleStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.isLayoutMarginsRelativeArrangement = true
    
        return stack
    }()
    
    lazy var mainStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
     
       
      
        contentView.addSubview(mainStack)
        
       
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStack.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

