//
//  OnBoardingViewController.swift
//  TomofilyaByIntern
//
//  Created by Arda Çimen on 27.03.2023.
//

import UIKit

class WatchLaterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var list = [String]()
    let mainView = WatchLaterView()
    let cellSpacingHeight: CGFloat = 15
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        navigationItem.title = "Watch Later"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        getWatchLater()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getWatchLater()
    }
    
    
    
    
    func getWatchLater() {
        NetworkController.shared.fetchWatchLaterData { result in
            switch result {
            case .success(let watchLaterData):
                self.list = watchLaterData
                self.mainView.tableView.reloadData()
            case .failure(let error):
                self.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [("OK", .default, nil)])
            }
        }
    }
    
    
}

extension WatchLaterViewController
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WatchLaterCell.identifier, for: indexPath) as! WatchLaterCell
        cell.titleLabel.text = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let itemName =  list[indexPath.row]
            NetworkController.shared.removeFromWatchLater(name: itemName) { result in
                switch result {
                case .success:
                    print("Item removed from watch later successfully")
                case .failure(let error):
                    print("Error removing item from watch later: \(error.localizedDescription)")
                }
            }
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
    }
    
    
    
}
