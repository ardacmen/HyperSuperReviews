//
//  OnboardingView.swift
//  astrologyToday
//
//  Created by Arda Çimen on 15.03.2023.
//

import UIKit

class WatchLaterView: UIView {
    
    
    
    
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
    
    
    let tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.register(WatchLaterCell.self, forCellReuseIdentifier: WatchLaterCell.identifier)
        return tableView
    }()

    
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [
                                        tableView
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

            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding.left),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding.right),
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding.top),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding.bottom),
        ])
    }

}


