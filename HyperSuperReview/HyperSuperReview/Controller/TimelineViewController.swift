//
//  TimelineViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 6.04.2023.
//

import UIKit

class TimelineViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    let mainView = TimelineView()
    var status = [Bool]()
    var review = [String]()
    var film = [String]()
    var mail = [String()]
    
    override func loadView() {
        self.view = mainView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        navigationItem.title = "Reviews"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.mainView.reviewCollectionView.delegate = self
        self.mainView.reviewCollectionView.dataSource = self
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        getData()
        
    }
    
    
    func getData()
    {
       
        NetworkController.shared.getReviews { result in
            switch result {
            case .success(let status, let review, let film, let mail):
                self.status = status
                self.review = review
                self.film = film
                self.mail = mail
                self.mainView.reviewCollectionView.reloadData()
            case .failure(let error):
                self.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
            }
        }

        
    }
    
}

extension TimelineViewController
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.reviewCollectionView.dequeueReusableCell(withReuseIdentifier: ReviewCV.identifier, for: indexPath) as! ReviewCV
      
        if mail.count > indexPath.row && film.count > indexPath.row && status.count > indexPath.row && review.count > indexPath.row
        {
            if status[indexPath.row] == true{
                cell.author.text = "Author : " + mail[indexPath.row]
                cell.film.text = "Film : " + film[indexPath.row]
                cell.content.text = "Review : " + review[indexPath.row]
            }
        }
       
        
        return cell
    }
    
}
