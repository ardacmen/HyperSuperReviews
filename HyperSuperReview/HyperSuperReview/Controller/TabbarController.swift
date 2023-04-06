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
        navController.tabBarItem.image = UIImage(systemName:  "house")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return navController
        
    }
    
    func createTabbarThirdelement() -> UIViewController{
        
        let rootViewController =  SettingsViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = "Settings"
        navController.tabBarItem.image = UIImage(systemName:  "gear")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return navController
        
    }
    
    func createSecondElement() -> UIViewController{
        
        let rootViewController =  TimelineViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = "Timeline"
        navController.tabBarItem.image = UIImage(systemName:  "hourglass")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return navController
        
    }
   
    
    
    
    func setupVCs(){
        
        viewControllers = [
            createTabbarFirstElement(),
            createSecondElement(),
            createTabbarThirdelement()
        ]
        
    }
    
    
    
}
