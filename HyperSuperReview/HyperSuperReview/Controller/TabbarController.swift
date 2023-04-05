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
        navController.tabBarItem.image = UIImage(systemName:  "house")
        return navController
        
    }
    
   
    
    
    
    func setupVCs(){
        
        viewControllers = [
            createTabbarFirstElement()
        ]
        
    }
    
    
    
}
