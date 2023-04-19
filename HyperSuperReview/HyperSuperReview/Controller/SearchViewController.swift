//
//  SearchViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 19.04.2023.
//



import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let mainView = SearchView()
    let searchBar = UISearchBar()
    var posts = [Posts]()
    var isSearching = false
    var searchedPost = [Posts]()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        hideKeyboardWhenTappedAround()
        searchBar.placeholder = "Film / Review / Person"
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = .white
        navigationItem.rightBarButtonItem = doneButton

        
        // Change search bar text color
        if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
            searchTextField.textColor = UIColor.white
        }

        // Change search bar placeholder text color
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let attributedPlaceholder = NSAttributedString(string: "Film / Review / Person", attributes: placeholderAttributes)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = attributedPlaceholder


        
        getFilms()
    }
    
    @objc func doneButtonTapped() {
        searchBar.resignFirstResponder()
        
        // Perform search
        if let searchText = searchBar.text, !searchText.isEmpty {
            isSearching = true
            searchedPost = posts.filter { post in
                if let title = post.title?.rendered {
                    return title.lowercased().contains(searchText.lowercased())
                } else {
                    return false
                }
            }
            mainView.tableView.reloadData()
        }
    }

    
    func getFilms()
    {
        NetworkController.shared.fetchPost { result in
            switch result {
            case .success(let posts):
                self.posts = posts
                self.mainView.tableView.reloadData()
            case .failure(let error):
                print("Error fetching posts: \(error)")
            }
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // handle search query
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // cancel search
        searchBar.text = nil
        isSearching = false
        mainView.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            mainView.tableView.reloadData()
            return
        }
        
        isSearching = true
        searchedPost = posts.filter { post in
            if let title = post.title?.rendered {
                return title.lowercased().contains(searchText.lowercased())
            } else {
                return false
            }
        }
        
        mainView.tableView.reloadData()
    }
}

extension SearchViewController
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching == false{
            return posts.count
        }else{
            return searchedPost.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isSearching == false{
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.titleLabel.text = cleanHTMLTags(posts[indexPath.row].title?.rendered ?? "")
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.titleLabel.text = cleanHTMLTags(searchedPost[indexPath.row].title?.rendered ?? "")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    
   
    
    func cleanHTMLTags(_ html: String) -> String {
        let clean = try? NSAttributedString(data: html.data(using: .utf8) ?? Data(), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string
        return clean ?? ""
    }
}
