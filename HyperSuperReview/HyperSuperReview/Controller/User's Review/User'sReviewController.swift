//
//  OnBoardingViewController.swift
//  TomofilyaByIntern
//
//  Created by Arda Çimen on 27.03.2023.
//

import UIKit
import Kingfisher

class UsersReviewViewController: UIViewController {
    
    var status = ""
    var review = ""
    var film = ""
    var mail = ""
    var url = ""
    var star = 0
    
    
    let mainView = UsersReviewView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        configure()
        
    }
    
    func configure()
    {
        mainView.category.text  = self.mail
        mainView.content.text  = self.review
        mainView.date.text  = String(self.status)
        mainView.imageView.kf.setImage(with: URL(string: self.url))
        mainView.title.text  = self.film
        mainView.userStar.text = "User Vote is, " + String(self.star)
      
        
    
    }
    
    
}
