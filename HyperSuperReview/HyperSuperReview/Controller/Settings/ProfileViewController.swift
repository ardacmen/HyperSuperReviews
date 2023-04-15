//
//  ProfileViewController.swift
//  astrologyToday
//
//  Created by Arda Çimen on 21.03.2023.
//

import UIKit
import FirebaseAuth


class ProfileViewController:  UIViewController {
    
    let mainView = ProfileView()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActionToElement()
        getData()
        hideKeyboardWhenTappedAround()
    }
    
    
    
    func addActionToElement(){
        
        mainView.deleteButton.addAction(UIAction{ [weak self] _ in
            self?.deleteButtonPressed()
        }, for: .touchUpInside)
        
        mainView.changePassword.addAction(UIAction{ [weak self] _ in
            self?.changePassword()
        }, for: .touchUpInside)
        
        mainView.saveButton.addAction(UIAction{ [weak self] _ in
            self?.saveButtonClicked()
        }, for: .touchUpInside)
        
    }
    
    func changePassword(){
        let vc = ChangePasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true )
    }
    
    
    func deleteButtonPressed(){
        
        let refreshAlert = UIAlertController(title: "Delete", message: "Do you want to delete your account?", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action: UIAlertAction!) in
            
            Auth.auth().currentUser?.delete { error in
                
                if error == nil{
                    let controller = SplashViewController()
                    let navigationController = UINavigationController(rootViewController: controller)
                    navigationController.modalPresentationStyle = .overCurrentContext
                    self.navigationController?.present(navigationController, animated: true, completion: nil)
                }else{
                    self.showAlert(title: "Error", message: error?.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                }
                
            }
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    func saveButtonClicked(){
        NetworkController.shared.changeInfo(name: self.mainView.nameTextField.text ?? ""){ error in
            if let error = error {
                self.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
            } else {
                
                self.showAlert(title: "Success", message: error?.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
                
            }
        }
    }
    
    func getData(){
        
        
        NetworkController.shared.getDataForInfo { (name, mail) in
            if let name = name, let mail = mail {
                self.mainView.emailTextField.text = mail
                self.mainView.emailTextField.isUserInteractionEnabled = false
                self.mainView.nameTextField.text = name
            } else {
                self.showAlert(title: "Error", message: "Try Again Later!", style: .alert, actions: [("OK", .default, nil)])
            }
            
        }
    }
}
