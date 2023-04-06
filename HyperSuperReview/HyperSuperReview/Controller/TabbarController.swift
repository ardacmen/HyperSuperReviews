import UIKit

class TabbarViewController : UITabBarController
{
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tabBar.tintColor =  UIColor.white
        setupVCs()
        
    }
    
    
    
    
    func createTabbarFirstElement() -> UIViewController{
        
        let rootViewController =  MainPageViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = "Home"
        navController.tabBarItem.image = UIImage(systemName:  "house")
        return navController
        
    }
    
    func createSecondElement() -> UIViewController{
        
        let rootViewController =  TimelineViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = "Timeline"
        navController.tabBarItem.image = UIImage(systemName:  "hourglass")
        return navController
        
    }
   
    
    
    
    func setupVCs(){
        
        viewControllers = [
            createTabbarFirstElement(),
            createSecondElement()
        ]
        
    }
    
    
    
}
