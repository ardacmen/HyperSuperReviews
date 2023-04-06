import UIKit
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
        navigationItem.title = "Films"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.mainView.postCollectionView.delegate = self
        self.mainView.postCollectionView.dataSource = self
      
      
        
       
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        
        let selectedItem = posts[indexPath.row]
        let selectedImg = img[indexPath.row]
        let detailsVC = DetailViewController()
        
        detailsVC.post.append(selectedItem)
        detailsVC.img = selectedImg
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.postCollectionView.dequeueReusableCell(withReuseIdentifier: MainPageCollectionViewCell.identifier, for: indexPath) as! MainPageCollectionViewCell
        if img.count == posts.count {
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.contentMode = .scaleToFill
            cell.label.text = cleanHTMLTags(posts[indexPath.row].title?.rendered ?? "")
            let url = URL(string: img[indexPath.row])!
            cell.imageView.kf.setImage(with: url)
            }
        
        return cell
    }
    
    func cleanHTMLTags(_ html: String) -> String {
        let clean = try? NSAttributedString(data: html.data(using: .utf8) ?? Data(), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string
        return clean ?? ""
    }
}

