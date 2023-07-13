//
//  ViewController.swift
//  ExampleSpringFadeTabs
//
//  Created by Azhar Anwar on 7/13/23.
//

import UIKit
import SpringFadeTabs

class ViewController: SpringFadeTabController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = DemoController(imageUrlString: "https://images.unsplash.com/photo-1688040696927-a0981dcc289f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=988&q=80")
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let secondVC = DemoController(imageUrlString: "https://images.unsplash.com/photo-1689170652466-1bfee78f78b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=988&q=80")
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let thirdVC = DemoController(imageUrlString: "https://images.unsplash.com/photo-1688853206609-da4e92648b84?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1002&q=80")
        thirdVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        viewControllers = [firstVC, secondVC, thirdVC]
    }
}
