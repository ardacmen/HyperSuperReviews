import UIKit

class TabbarViewController : UITabBarController
{
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tabBar.tintColor =  UIColor.black
        setupVCs()
        
    }
    
    
    
    
    func createTabbarFirstElement() -> UIViewController{
        
        let rootViewController =  MainPageViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = "Home"
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navController.tabBarItem.title = "TimeLine"
        navController.tabBarItem.image = UIImage(systemName:  "house")
        return navController
        
    }
    
   
    
    
    
    func setupVCs(){
        
        viewControllers = [
            createTabbarFirstElement()
        ]
        
    }
    
    
    
}
