//
//  ProfileViewController.swift
//  astrologyToday
//
//  Created by Arda Çimen on 21.03.2023.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class ProfileViewController:  UIViewController ,  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let mainView = ProfileView()
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = "Profil Settings"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        mainView.imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        mainView.imageView.addGestureRecognizer(imageTapRecognizer)
        
        addActionToElement()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        getImage()
    }
    
    func getImage()
    {
        let storageRef = Storage.storage().reference().child("profilePhotos/\(String(describing: Auth.auth().currentUser!.email!)).jpg")
        
        
        storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            guard let imageData = data, error == nil else {
                print("Error downloading image: \(error!)")
                return
            }
            
            
            let image = UIImage(data: imageData)
            self.mainView.imageView.image = image
        }
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
    
    @objc func selectImage() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        
        self.mainView.imageView.image = image
        self.dismiss(animated: true, completion: nil)
        
        let storageRef = Storage.storage().reference().child("profilePhotos/\(String(describing: Auth.auth().currentUser!.email!)).jpg")
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            return
        }
        
        let uploadTask = storageRef.putData(imageData, metadata: nil) { metadata, error in
            guard error == nil else {
                print("Error uploading image: \(error!)")
                return
            }
            
            // Image uploaded successfully
            print("Image uploaded successfully!")
        }
        
        uploadTask.observe(.progress) { snapshot in
            let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount) / Double(snapshot.progress!.totalUnitCount)
            print("Upload progress: \(percentComplete)%")
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
