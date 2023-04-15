//
//  ChangePasswordViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 7.04.2023.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    
    
    let mainView = ChangePasswordView()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAction()
        hideKeyboardWhenTappedAround()
        mainView.titleLabel.text = "Change Password"
    }
    
    func addAction()
    {
        mainView.saveButton.addAction(UIAction{ [weak self] _ in
            self?.changePassword()
        }, for: .touchUpInside)
    }
    
    func changePassword()
    {
        if mainView.textField1.text == mainView.textField2.text
        {
            NetworkController.shared.changePassword(password: mainView.textField1.text ?? ""){ error in
                if let error = error {
                    self.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                } else {
                    self.showAlert(title: "Success", message: error?.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                }
            }
        }else
        {
            self.showAlert(title: "Error", message: "password fields are not same!", style: .alert, actions: [("OK", .default, nil)])
        }
    }
}
