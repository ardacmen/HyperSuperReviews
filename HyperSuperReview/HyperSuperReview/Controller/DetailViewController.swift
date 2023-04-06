//
//  DetailViewController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 6.04.2023.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {

    var post = [Posts]()
    var img = ""
    
    
    let mainView = DetailView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
        // Set the navigation bar title color to white
        navigationItem.title = cleanHTMLTags(post[0].title?.rendered ?? "")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]


    }
    
    @objc func addButtonTapped() {
        let vc = CommentViewController()
        vc.title2 = cleanHTMLTags(post[0].title?.rendered ?? "")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func configure()
    {
        let url = URL(string: img)
        mainView.imageView.contentMode = .scaleToFill
        mainView.imageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
        
        mainView.title.text = cleanHTMLTags(post[0].title?.rendered ?? "")
        mainView.date.text = formatDate(inputString: cleanHTMLTags(post[0].date ?? ""))
        mainView.content.text = cleanHTMLTags(post[0].content?.rendered ?? "")
        
        
    }
    
    func cleanHTMLTags(_ html: String) -> String {
        let clean = try? NSAttributedString(data: html.data(using: .utf8) ?? Data(), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string
        return clean ?? ""
    }
    
    func formatDate(inputString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = dateFormatter.date(from: inputString) else {
            return nil
        }
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
   

}
