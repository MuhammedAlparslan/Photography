//
//  LoginCoordinator.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import Foundation
import UIKit

class LoginCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showClickedController() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterController") as! RegisterController
        navigationController.show(controller, sender: nil)
    }
}
