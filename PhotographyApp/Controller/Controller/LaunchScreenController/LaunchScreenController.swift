//
//  LaunchScreenController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 19.05.2023.
//

import UIKit

class LaunchScreenController: UIViewController {

    private var coordinator: LaunchScrennCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
     }
    
    func configureUI() {
        coordinator = LaunchScrennCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    @IBAction func getStartedClicked(_ sender: Any) {
        coordinator?.showClickedController()
    }
    

}
