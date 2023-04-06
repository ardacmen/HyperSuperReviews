//
//  CommentViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 6.04.2023.
//

import UIKit

class CommentViewController: UIViewController {

    var title2 = ""
    let mainView = CommentView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.titleLabel.text = title2
        addAction()
    }
    
    func addAction()
    {
        
    }



}
