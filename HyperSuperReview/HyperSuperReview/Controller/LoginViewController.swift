//
//  LoginViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 5.04.2023.
//

import UIKit


class LoginViewController: UIViewController {
    
    
    let mainView = LoginView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAction()
        self.mainView.emailTextField.text = "ardacmen@gmail.com"
        self.mainView.passwordTextField.text = "Ardabjk1903"
        
    }
    
    func addAction()
    {
        mainView.LoginButton.addAction(UIAction{ [weak self] _ in
            
            NetworkController.shared.login(mail: self?.mainView.emailTextField.text ?? "", password: self?.mainView.passwordTextField.text ?? ""){ error in
                if let error = error {
                    self?.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                } else {
                    
                    let vc = TabbarViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true)
                    
                }
            }
            
        }, for: .touchUpInside)
    }
    
    
    
}
