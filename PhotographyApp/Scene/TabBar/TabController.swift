//
//  TabController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 9.06.2023.
//

import UIKit


class TabController: UITabBarController, UITabBarControllerDelegate {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupMiddleButton()
    }
    
    // TabBarButton – Setup Middle Button
    func setupMiddleButton() {
        
        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))
        
        //STYLE THE BUTTON YOUR OWN WAY
        
        middleBtn.backgroundColor = .white
        middleBtn.setImage(UIImage(named: "Discovery"), for: .normal)
        middleBtn.layer.cornerRadius = (middleBtn.layer.frame.width / 2)
        
        //add to the tabbar and add click event
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.discoverButtonAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    // Menu Button Touch Action
    @objc func discoverButtonAction(sender: UIButton) {
        self.selectedIndex = 1
        let controller = storyboard?.instantiateViewController(identifier: "DiscoveryController") as! DiscoveryController
        navigationController?.show(controller, sender: nil)
    }
}

