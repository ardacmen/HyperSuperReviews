import UIKit

class TabbarViewController : UITabBarController
{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set tab bar tint color
        tabBar.tintColor = UIColor.white
        
        // Set up view controllers
        setupVCs()
        
        // Set navigation bar title text attributes
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
    }

    
    
    
    
    func createTabbarFirstElement() -> UIViewController{
        
        let rootViewController =  MainPageViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = "Home"
        navController.tabBarItem.image = UIImage(systemName:  "house")?.withTintColor(.white, renderingMode: .alwaysOriginal).resize(targetSize: CGSize(width: 32, height: 32))
        return navController
        
    }
    
    func createTabbarThirdelement() -> UIViewController{
        
        let rootViewController =  SettingsViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = "Settings"
        navController.tabBarItem.image = UIImage(systemName:  "gear")?.withTintColor(.white, renderingMode: .alwaysOriginal).resize(targetSize: CGSize(width: 32, height: 32))
        return navController
        
    }
    
    func createSecondElement() -> UIViewController{
        
        let rootViewController =  TimelineViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = "Timeline"
        navController.tabBarItem.image = UIImage(systemName:  "hourglass")?.withTintColor(.white, renderingMode: .alwaysOriginal).resize(targetSize: CGSize(width: 32, height: 32))
        return navController
        
    }
   
    func createFourthElement() -> UIViewController{
        
        let rootViewController =  WatchLaterViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = "Watch List"
        navController.tabBarItem.image = UIImage(named: "television")?.withTintColor(.white, renderingMode: .alwaysOriginal).resize(targetSize: CGSize(width: 32, height: 32))
        return navController
        
    }
    
    
    func setupVCs(){
        
        viewControllers = [
            createTabbarFirstElement(),
            createSecondElement(),
            createFourthElement(),
            createTabbarThirdelement()
           
        ]
        
    }
    
    
    
}
