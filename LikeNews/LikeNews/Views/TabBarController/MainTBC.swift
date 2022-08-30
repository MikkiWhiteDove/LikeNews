//
//  MainTVC.swift
//  LikeNews
//
//  Created by Mishana on 30.08.2022.
//

import UIKit

class MainTBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        generateTabBar()
        
    }
    
    private func generateTabBar() {
        viewControllers = [
        generateVC(viewController: navBar(), title: "All news", image: UIImage(systemName: "list.bullet")),
        generateVC(viewController: navBarLike(), title: "Like news", image: UIImage(systemName: "heart"))
        ]
    }
    
    func navBar()-> UIViewController {
        let vc = NewsVC()
        vc.navigationItem.title = "Search"
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }
    func navBarLike()-> UIViewController {
        let vc = LikesVC()
        vc.navigationItem.title = "Like news"
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
        
    }
}
