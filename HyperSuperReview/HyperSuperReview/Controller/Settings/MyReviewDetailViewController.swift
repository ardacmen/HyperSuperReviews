//
//  MyReviewDetailViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 19.04.2023.
//


import UIKit
import Kingfisher

class MyReviewDetailViewController: UIViewController {
    
    
    var mainView = MyReviewDetailView()
    var text = ""
    var rating =  0
    var film = ""
    var email = ""
    var status =  false
    var url = ""
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure()
    {
        mainView.title.text = film
        mainView.userStar.text = "Your Star is : \(rating)"
        mainView.category.text = "Written By You"
        if status == false
        {
            mainView.date.text =  "In Timeline"
        }else{
            mainView.date.text = "Editor Liked"
        }
        mainView.imageView.kf.setImage(with: URL(string: url))
        mainView.content.text = text
        
    }
    
    
    
}
