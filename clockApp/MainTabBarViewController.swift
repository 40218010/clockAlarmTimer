//
//  ViewController.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/18.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabBar()

    }
    
   private func setUpTabBar() {
        
        let controller1 = L1ViewController()
        controller1.title = "世界時鐘"
        let nav1 = UINavigationController(rootViewController: controller1)
        
        let controller2 = L2ViewController()
        controller2.title = "鬧鐘"
        let nav2 = UINavigationController(rootViewController: controller2)
        
        let controller3 = R2ViewController()
        controller3.title = "碼錶"
        let nav3 = UINavigationController(rootViewController: controller3)
        
        let controller4 = R1ViewController()
        controller4.title = "計時器"
        let nav4 = UINavigationController(rootViewController: controller4)
        
        self.setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        
        guard let items = self.tabBar.items else { return }
        let images = ["globe", "alarm", "stopwatch", "timer"]
        for x in 0...3 {
            items[x].image = UIImage(systemName: images[x])
        }
        
        
        self.tabBar.tintColor = .blue
    }
    

    
    
    
    
    
    
    
    
}



