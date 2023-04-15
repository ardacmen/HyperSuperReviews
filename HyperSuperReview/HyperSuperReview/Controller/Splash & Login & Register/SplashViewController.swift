//
//  OnBoardingViewController.swift
//  TomofilyaByIntern
//
//  Created by Arda Çimen on 27.03.2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    
    let mainView = SplashView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        addAction()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func addAction()
    {
        mainView.registerButton.addAction(UIAction{ [weak self] _ in
            self?.pushRegister()
        }, for: .touchUpInside)
        
        mainView.loginButton.addAction(UIAction{ [weak self] _ in
            self?.pushLogin()
        }, for: .touchUpInside)
    }
    
    
    func pushRegister()
    {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
                                       
                                       
    func pushLogin()
    {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
         
    
    
}
