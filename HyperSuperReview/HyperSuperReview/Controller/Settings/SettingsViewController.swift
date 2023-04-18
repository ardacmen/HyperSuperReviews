//
//  SideMenuViewController.swift
//  astrologyToday
//
//  Created by Arda Çimen on 16.03.2023.
//

import UIKit


class SettingsViewController:   UIViewController   {
    
    let mainView = SettingsView()
    
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageViewList = [
            mainView.profileImageView,
            mainView.requestImageView,
            mainView.logoutImageView
        ]
        setupImageViews(imageViews: imageViewList)
        hideKeyboardWhenTappedAround()
        addAction()
        navigationItem.title = "Settings"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    func addAction()
    {
        
    }
    
    func setupImageViews(imageViews: [UIImageView]) {
        
        for imageView in imageViews {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
            
            
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let data = tappedImage.image?.pngData()
        
        if data == UIImage(systemName: "person")?.withTintColor(.white, renderingMode: .alwaysOriginal).pngData()
        {
            let controller = ProfileViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }else if data ==  UIImage(systemName: "return.left")?.withTintColor(.white, renderingMode: .alwaysOriginal).pngData(){
            UserDefaults.standard.set(false, forKey: "login")
            self.tabBarController?.tabBar.isHidden = true
            let controller = SplashViewController()
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(navigationController, animated: true, completion: nil)
        }else{
            let controller = RequestViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    
    
}
