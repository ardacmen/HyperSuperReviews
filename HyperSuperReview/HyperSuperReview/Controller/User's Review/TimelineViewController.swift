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
            
            cell.author.text = "Author :\n" + mail[indexPath.row]
            cell.filmName.text = "Film :\n" + film[indexPath.row]
            if star[indexPath.row] == 1{
                cell.star1.isStarred = true
                cell.star2.isStarred = false
                cell.star3.isStarred = false
                cell.star4.isStarred = false
                cell.star5.isStarred = false
            }else if star[indexPath.row] == 2{
                cell.star1.isStarred = true
                cell.star2.isStarred = true
                cell.star3.isStarred = false
                cell.star4.isStarred = false
                cell.star5.isStarred = false
            }else if star[indexPath.row] == 3{
                cell.star1.isStarred = true
                cell.star2.isStarred = true
                cell.star3.isStarred = true
                cell.star4.isStarred = false
                cell.star5.isStarred = false
            }else if star[indexPath.row] == 4{
                cell.star1.isStarred = true
                cell.star2.isStarred = true
                cell.star3.isStarred = true
                cell.star4.isStarred = true
                cell.star5.isStarred = false
            }else{
                cell.star1.isStarred = true
                cell.star2.isStarred = true
                cell.star3.isStarred = true
                cell.star4.isStarred = true
                cell.star5.isStarred = true
            }
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
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UsersReviewViewController()
        vc.film = film[indexPath.row]
        vc.review = review[indexPath.row]
        vc.star = star[indexPath.row]
        vc.url = url[indexPath.row]
        vc.mail = mail[indexPath.row]
        if status[indexPath.row] == true{
            vc.status = "Editor Liked!"
        }else{
            vc.status = "Normal Review!"
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
