//
//  CustomStarButton.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 8.04.2023.
//

import Foundation
import UIKit

class StarButton: UIButton {
    var isStarred: Bool = false {
        didSet {
            let imageName = isStarred ? "star.fill" : "star"
            setImage(UIImage(systemName: imageName)?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(named: "star")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func starButtonTapped() {
        isStarred.toggle()
    }
    
}
