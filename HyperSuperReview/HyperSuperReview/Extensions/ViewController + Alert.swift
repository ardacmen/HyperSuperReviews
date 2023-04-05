import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String?, style: UIAlertController.Style, actions: [(title: String, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?)] = [("OK", .default, nil)]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        for action in actions {
            let alertAction = UIAlertAction(title: action.title, style: action.style, handler: action.handler)
            alert.addAction(alertAction)
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 18)
        ]
        
        let attributedTitle = NSAttributedString(string: title ?? "", attributes: attributes)
        let attributedMessage = NSAttributedString(string: message ?? "", attributes: attributes)
        
        alert.setValue(attributedTitle, forKey: "attributedTitle")
        alert.setValue(attributedMessage, forKey: "attributedMessage")
        
        alert.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        alert.view.layer.cornerRadius = 15
        
        present(alert, animated: true, completion: nil)
    }
    
}

