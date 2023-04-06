//
//  RegisterViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 5.04.2023.
//

import UIKit

class RegisterViewController: UIViewController {

    
    let mainView = RegisterView()
    
    
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
        
        mainView.registerButton.addAction(UIAction{ [weak self] _ in
            NetworkController.shared.register(mail: self?.mainView.emailTextField.text ?? "", password: self?.mainView.passwordTextField.text ?? "", name: self?.mainView.nameTextField.text ?? "") { error in
                if let error = error {
                    self?.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                } else {
                    self?.showAlert(title: "Success", message: error?.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                }
            }
            
            NetworkController.shared.saveDataWhenClickRegister(mail: self?.mainView.emailTextField.text ?? "", name: self?.mainView.nameTextField.text ?? ""){ error in
                if let error = error {
                    self?.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                } else {
                    self?.showAlert(title: "Success", message: error?.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                }
            }
            
            
        }, for: .touchUpInside)
        
        
        
    }
   
   

}
