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
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .white
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .gray
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .black
        thirdVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        viewControllers = [firstVC, secondVC, thirdVC]
    }
}
