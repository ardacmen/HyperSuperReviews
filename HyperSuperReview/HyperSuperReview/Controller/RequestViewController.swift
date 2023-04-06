//
//  OnBoardingViewController.swift
//  TomofilyaByIntern
//
//  Created by Arda Çimen on 27.03.2023.
//

import UIKit

class RequestViewController: UIViewController {
    
    
    let mainView = RequestView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = "Request"
        mainView.titleLabel.text = "Write the movie you want to see in the app"
        
    }
    
    
    
    
}
