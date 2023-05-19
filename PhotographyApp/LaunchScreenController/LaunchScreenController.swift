//
//  LaunchScreenController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 19.05.2023.
//

import UIKit

class LaunchScreenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
 
     }
    
    
    
    @IBAction func getStartedClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "LoginController") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
    

}
