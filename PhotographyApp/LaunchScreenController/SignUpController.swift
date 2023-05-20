//
//  SignUpController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 19.05.2023.
//

import UIKit


class SignUpController: UIViewController   {
    @IBOutlet private weak var titleText: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    func configureUI() {
        navigationItem.hidesBackButton = true

        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: titleText.frame.height - 3, width: titleText.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        titleText.borderStyle = UITextField.BorderStyle.none
        titleText.layer.addSublayer(bottomLine)
    }
   
    @IBAction func nextClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "RegisterController") as! RegisterController
        controller.delegate = titleText.text
        navigationController?.show(controller, sender: nil)
       
        
        
    }
    
}


