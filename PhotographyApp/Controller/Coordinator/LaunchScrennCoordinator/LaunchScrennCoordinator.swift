//
//  LaunchScrennCoordinator.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import Foundation
import UIKit

class LaunchScrennCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showClickedController() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignUpController") as!  SignUpController
        navigationController.show(controller, sender: nil)
    }
    
}
