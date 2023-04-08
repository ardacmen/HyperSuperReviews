//
//  TimelineViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 6.04.2023.
//

import UIKit
import Kingfisher
class TimelineViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    let mainView = TimelineView()
    var status = [Bool]()
    var review = [String]()
    var film = [String]()
    var mail = [String()]
    var url = [String]()
    var star = [Int]()
    
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
            case .success(let status, let review, let film, let mail , let url, let rate):
                self.status = status
                self.review = review
                self.film = film
                self.url = url
                self.mail = mail
                self.star = rate
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
                cell.author.text = "Author :\n" + mail[indexPath.row]
                cell.filmName.text = "Film :\n" + film[indexPath.row]
                
                if review[indexPath.row].count > 70 {
                    let reviewText = review[indexPath.row]
                    let spaceIndex = reviewText.index(reviewText.startIndex, offsetBy: 70, limitedBy: reviewText.endIndex) ?? reviewText.endIndex
                    let truncatedText = reviewText[..<spaceIndex].trimmingCharacters(in: .whitespacesAndNewlines)
                    let readMoreText = "\nRead More"
                    let attributedReadMoreText = NSAttributedString(string: readMoreText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue])
                    let attributedText = NSMutableAttributedString(string: truncatedText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
                    attributedText.append(attributedReadMoreText)
                    cell.content.attributedText = attributedText
                } else {
                    cell.content.text = "Review :\n" + review[indexPath.row]
                    cell.content.textColor = .white
                }


                cell.image.kf.setImage(with: URL(string: url[indexPath.row]))
            }
        }
       
        
        return cell
    }
    
}
