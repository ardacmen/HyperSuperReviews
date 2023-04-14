import UIKit
import Foundation
import Kingfisher

class MainPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    let mainView = MainPageView()
    var posts = [Posts]()
    var searching = false
    var searchedPosts = [Posts]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureSearchController()
        navigationItem.title = "Loading..."
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.mainView.postCollectionView.delegate = self
        self.mainView.postCollectionView.dataSource = self
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        fetchPosts()
    }
    
    func configureSearchController()
    {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext  = true
        searchController.searchBar.placeholder = "Search Film"
        
    }
    
    
    
    
    
    
    
    
    func fetchPosts() {
        NetworkController.shared.fetchPost { result in
            switch result {
            case .success(let posts):
                self.posts = posts
                self.mainView.postCollectionView.reloadData()
            case .failure(let error):
                print("Error fetching posts: \(error)")
            }
        }
    }
}

extension MainPageViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching
        {
            return searchedPosts.count
        }else{
            return posts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let selectedItem = posts[indexPath.row]
        let selectedImg = posts[indexPath.row].yoast_head_json?.og_image?[0].url
        let detailsVC = DetailViewController()
        
        detailsVC.post.append(selectedItem)
        detailsVC.img = selectedImg ?? ""
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.postCollectionView.dequeueReusableCell(withReuseIdentifier: MainPageCollectionViewCell.identifier, for: indexPath) as! MainPageCollectionViewCell
        
        if searching
        {
            
            navigationItem.title = "Films"
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.contentMode = .scaleToFill
            cell.label.text = cleanHTMLTags(searchedPosts[indexPath.row].title?.rendered ?? "")
            let url = URL(string: searchedPosts[indexPath.row].yoast_head_json?.og_image?[0].url ?? "")!
            cell.imageView.kf.setImage(with: url)
            
        }else{
            
            navigationItem.title = "Films"
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.contentMode = .scaleToFill
            cell.label.text = cleanHTMLTags(posts[indexPath.row].title?.rendered ?? "")
            let url = URL(string: posts[indexPath.row].yoast_head_json?.og_image?[0].url ?? "")!
            cell.imageView.kf.setImage(with: url)
            
        }
        
        return cell
    }
    
    func cleanHTMLTags(_ html: String) -> String {
        let clean = try? NSAttributedString(data: html.data(using: .utf8) ?? Data(), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string
        return clean ?? ""
    }
}


extension MainPageViewController :  UISearchBarDelegate , UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            searchedPosts.removeAll(keepingCapacity: false)
            for post in posts{
                if ((post.title?.rendered?.lowercased().contains(searchText.lowercased())) != nil){
                    searchedPosts.append(post)
                }
            }
        }else{
            searching = false
            searchedPosts.removeAll(keepingCapacity: false)
            searchedPosts = posts
        }
        mainView.postCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedPosts.removeAll(keepingCapacity: false)
    }
}
