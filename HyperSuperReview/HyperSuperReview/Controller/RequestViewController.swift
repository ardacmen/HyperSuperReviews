//
//  OnBoardingViewController.swift
//  TomofilyaByIntern
//
//  Created by Arda Çimen on 27.03.2023.
//

import UIKit
import Firebase

class RequestViewController: UIViewController {
    
    
    let mainView = RequestView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = "Request"
        hideKeyboardWhenTappedAround()
        mainView.titleLabel.text = "Write the movie you want to see in the app"
        addAction()
    }
    
    func addAction()
    {
        mainView.saveButton.addAction(UIAction{ [weak self] _ in
            self?.save()
        }, for: .touchUpInside)
    }
    
    func save()
    {
        NetworkController.shared.saveRequest(mail: Auth.auth().currentUser?.email ?? "", request: self.mainView.textField.text ?? ""){ error in
            if let error = error {
                self.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
            } else {
                self.showAlert(title: "Success", message: error?.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
            }
        }
    }
    
    
}
