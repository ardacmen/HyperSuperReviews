//
//  OnBoardingViewController.swift
//  TomofilyaByIntern
//
//  Created by Arda Çimen on 27.03.2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    
    let mainView = ForgotPassword()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAction()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    func addAction()
    {
        mainView.LoginButton.addAction(UIAction{ [weak self] _ in
            NetworkController.shared.resetPassword(mail: self?.mainView.emailTextField.text ?? ""){ error in
                if let error = error {
                    self?.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                } else {
                    
                    self?.showAlert(title: "Success", message: error?.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                    
                }
            }
        }, for: .touchUpInside)
    }
    
    
    
}
