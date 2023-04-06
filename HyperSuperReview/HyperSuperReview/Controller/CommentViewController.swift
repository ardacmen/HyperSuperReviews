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
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.titleLabel.text = title2
        addAction()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func addAction()
    {
        mainView.saveButton.addAction(UIAction{ [weak self] _ in
            self?.save()
        }, for: .touchUpInside)
    }

    
    func save()
    {
        
        if mainView.textView.text != "..."
        {
            NetworkController.shared.saveCommentWhenClickSave(mail: (Auth.auth().currentUser?.email)!, review: mainView.textView.text, film: title2){ error in
                if let error = error {
                    self.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                } else {
                    
                    self.showAlert(title: "Success", message: error?.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                    
                }
            }
        }else
        {
            self.showAlert(title: "Error", message: "Please Enter Review", style: .alert, actions: [("OK", .default, nil)])
        }
        
    }

}
