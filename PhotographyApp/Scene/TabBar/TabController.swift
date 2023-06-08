//
//  TabController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 9.06.2023.
//

import UIKit

class TabController: UITabBarController, UITabBarControllerDelegate {

        
        var upperLineView: UIView!
        
        let spacing: CGFloat = 12

        override func viewDidLoad() {
            super.viewDidLoad()
            self.delegate = self
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                self.addTabbarIndicatorView(index: 0, isFirstTime: true)
            }
        }
        
        ///Add tabbar item indicator uper line
        func addTabbarIndicatorView(index: Int, isFirstTime: Bool = false){
            guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
                return
            }
            if !isFirstTime{
                upperLineView.removeFromSuperview()
            }
        }

    }


