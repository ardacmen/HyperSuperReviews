
import Firebase
import UIKit

struct Review {
    let text: String
    let rating: Int
    let film: String
    let email: String
    let status: Bool
    let url: String
}


class MyReviewsViewController: UIViewController {
    
    var reviews = [Review]()
    
    let mainView = MyReviewsView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        getAllData()
        navigationItem.title = "My Reviews"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    func getAllData()
    {
        NetworkController.shared.fetchAllDocumentsInCollection(collectionName: "reviews") { result in
            switch result {
            case .success(let documents):
                // Handle the fetched documents here
                for document in documents {
                    let data = document.data()
                    if let text = data["review"] as? String,
                       let rating = data["rate"] as? Int,
                       let film = data["film"] as? String,
                       let email = data["mail"] as? String,
                       let status = data["status"] as? Bool,
                       let url = data["url"] as? String {
                        let review = Review(text: text, rating: rating, film: film, email: email, status: status, url: url)
                        if email == Auth.auth().currentUser?.email {
                            self.reviews.append(review)
                        }
                        else {
                            print("Missing email field in retrieved data")
                        }
                    }
                    else {
                        print("Missing field(s) in retrieved data")
                    }
                }
                self.mainView.tableView.reloadData()
            case .failure(let error):
                // Handle the error here
                print("Error fetching documents: \(error.localizedDescription)")
            }
        }
    }
    
    
}

extension MyReviewsViewController : UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("girdi")
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyReviewTableViewCell.identifier, for: indexPath) as! MyReviewTableViewCell
        print("girdi2")
        cell.titleLabel.text = reviews[indexPath.row].film
        
        return cell
    }
    
    
}

