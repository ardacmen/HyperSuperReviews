//
//  CommentViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 6.04.2023.
//

import UIKit
import Firebase
class CommentViewController: UIViewController {

    var title2 = ""
    let mainView = CommentView()
    var starRate = 6
    var imgUrl = ""
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.titleLabel.text = title2
        addAction()
        hideKeyboardWhenTappedAround()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        mainView.star1.isStarred = false
        mainView.star2.isStarred = false
        mainView.star3.isStarred = false
        mainView.star4.isStarred = false
        mainView.star5.isStarred = false
        
    }
    
    func addAction()
    {
        mainView.saveButton.addAction(UIAction{ [weak self] _ in
            self?.save()
        }, for: .touchUpInside)
        
        mainView.star1.addAction(UIAction { [weak self] _ in
            self?.star1tapped()
        }, for: .touchUpInside)
        
        mainView.star2.addAction(UIAction { [weak self] _ in
            self?.star2tapped()
        }, for: .touchUpInside)
        
        mainView.star3.addAction(UIAction { [weak self] _ in
            self?.star3tapped()
        }, for: .touchUpInside)
        
        mainView.star4.addAction(UIAction { [weak self] _ in
            self?.star4tapped()
        }, for: .touchUpInside)
        
        mainView.star5.addAction(UIAction { [weak self] _ in
            self?.star5tapped()
        }, for: .touchUpInside)
        
    }

    func star1tapped()
    {
        mainView.star1.isStarred = true
        mainView.star2.isStarred = false
        mainView.star3.isStarred = false
        mainView.star4.isStarred = false
        mainView.star5.isStarred = false
        starRate = 1
    }
    
    func star2tapped()
    {
        mainView.star1.isStarred = true
        mainView.star2.isStarred = true
        mainView.star3.isStarred = false
        mainView.star4.isStarred = false
        mainView.star5.isStarred = false
        starRate = 2
    }
    
    func star3tapped()
    {
        mainView.star1.isStarred = true
        mainView.star2.isStarred = true
        mainView.star3.isStarred = true
        mainView.star4.isStarred = false
        mainView.star5.isStarred = false
        starRate = 3
    }
    
    func star4tapped()
    {
        mainView.star1.isStarred = true
        mainView.star2.isStarred = true
        mainView.star3.isStarred = true
        mainView.star4.isStarred = true
        mainView.star5.isStarred = false
        starRate = 4
    }
    
    func star5tapped()
    {
        mainView.star1.isStarred = true
        mainView.star2.isStarred = true
        mainView.star3.isStarred = true
        mainView.star4.isStarred = true
        mainView.star5.isStarred = true
        starRate = 5
    }
    
    func save()
    {
        
        if mainView.textView.text != "..."
        {
            
            if starRate <= 5 && starRate >= 0
            {
                NetworkController.shared.saveCommentWhenClickSave(imgUrl : imgUrl,starRate: starRate, mail: (Auth.auth().currentUser?.email)!, review: mainView.textView.text, film: title2){ error in
                    if let error = error {
                        self.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                    } else {
                        
                        self.showAlert(title: "Success", message: "After Checking, It will be published", style: .alert, actions: [("OK", .default, nil)])
                        
                    }
                }
            }else{
                self.showAlert(title: "Error", message: "Enter star rate", style: .alert, actions: [("OK", .default, nil)])
            }
        }else
        {
            self.showAlert(title: "Error", message: "Please Enter Review", style: .alert, actions: [("OK", .default, nil)])
        }
        
    }

}
