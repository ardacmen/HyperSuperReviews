//
//  MainPageViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 6.04.2023.
//

import UIKit
import Kingfisher

class MainPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    let mainView =  MainPageView()
    var posts = [Posts]()
    var id = [String]()
    var img = [String]()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Timeline"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.mainView.postCollectionView.delegate = self
        self.mainView.postCollectionView.dataSource = self
        fetchPosts()
    }
    
    func imgFetcher(){
        
        for i in 0...id.count-1
        {
            if let range = id[i].range(of: "?p=") {
                let parameter = id[i][range.upperBound...]
                id[i] = String(parameter)
            }
        }
        
        if self.id.count > 0
        {
            var fetchedImages = [String]()
            for i in 0...id.count-1
            {
                NetworkController.shared.takeImgUrl(id: id[i]) { imgUrl in
                    fetchedImages.append(imgUrl)
                    
                    if fetchedImages.count == self.id.count {
                        self.img = fetchedImages
                        DispatchQueue.main.async {
                            self.mainView.postCollectionView.reloadData()
                        }
                    }
                } 
            }
        }
    }

    
    
    
    func fetchPosts() {
        NetworkController.shared.fetchPost { result in
            switch result {
            case .success(let posts):
                self.posts = posts
                self.idFiller()
            case .failure(let error):
                print("Error fetching posts: \(error)")
            }
        }
        
    }
    
    func idFiller(){
        
            for i in 0...posts.count-1
            {
                id.append(posts[i].guid?.rendered ?? "")
                
                if i == posts.count-1
                {
                    self.imgFetcher()
                }
                
            }
        
    }
    
}


extension MainPageViewController
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.postCollectionView.dequeueReusableCell(withReuseIdentifier: MainPageCollectionViewCell.identifier, for: indexPath) as! MainPageCollectionViewCell
        cell.imageView.contentMode = .scaleToFill
        cell.label.text = posts[indexPath.row].title?.rendered
        let url = URL(string: img[indexPath.row])
        cell.imageView.kf.setImage(with: url)
        return cell
    }
}
