import UIKit
import Alamofire
import Foundation
import Kingfisher

class MainPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let mainView = MainPageView()
    var posts = [Posts]()
    var id = [Int]()
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
    
    func imgFetcher() {
        for i in 0..<posts.count {
            id.append(posts[i].id ?? 0)
        }
        
        if id.count > 0 {
            var fetchedImages = [String?](repeating: nil, count: id.count)
            for i in 0..<id.count {
                NetworkController.shared.takeImgUrl(id: id[i]) { imgUrl in
                    fetchedImages[i] = imgUrl
                        
                    if fetchedImages.allSatisfy({ $0 != nil }) {
                        self.img = fetchedImages.compactMap { $0 }
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
                self.imgFetcher()
            case .failure(let error):
                print("Error fetching posts: \(error)")
            }
        }
    }
}

extension MainPageViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.postCollectionView.dequeueReusableCell(withReuseIdentifier: MainPageCollectionViewCell.identifier, for: indexPath) as! MainPageCollectionViewCell
        
        if img.count == posts.count {
            cell.imageView.contentMode = .scaleToFill
            cell.label.text = posts[indexPath.row].title?.rendered
            let url = URL(string: img[indexPath.row])
            cell.imageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder")) { result in
                switch result {
                case .success(_):
                    cell.setNeedsLayout()
                case .failure(let error):
                    print("Error setting image: \(error)")
                }
            }
        } else {
            cell.label.text = ""
            cell.imageView.image = UIImage(named: "placeholder")
        }
        
        return cell
    }
}

