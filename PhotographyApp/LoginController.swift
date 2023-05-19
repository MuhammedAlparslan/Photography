//
//  LoginController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 19.05.2023.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet private weak var passwordText : UITextField!
    @IBOutlet private weak var hidenPassword: UIButton!
    @IBOutlet private weak var emailText    : UITextField!
    
    
    private var keepMyPassword   :    Bool          = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureEText()
        configurePTextUI()
        
    }
    func configurePTextUI() {
        let bottomLines = CALayer()
        bottomLines.frame = CGRect(x: 0.0, y: passwordText.frame.height - 5, width: passwordText.frame.width, height: 1.0)
        bottomLines.backgroundColor = UIColor.white.cgColor
        passwordText.borderStyle = UITextField.BorderStyle.none
        passwordText.layer.addSublayer(bottomLines)
    }

    func configureEText() {
        navigationItem.hidesBackButton = true
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: emailText.frame.height - 5, width: emailText.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        emailText.borderStyle = UITextField.BorderStyle.none
        emailText.layer.addSublayer(bottomLine)
    }
    
    @IBAction func hidenPasswordClicked(_ sender: Any) {
        if keepMyPassword {
            passwordText.isSecureTextEntry = false
        } else {
            passwordText.isSecureTextEntry = true
        }
        keepMyPassword = !keepMyPassword
    }

    
    @IBAction func loginClicked(_ sender: Any) {
    }
    
    @IBAction func createAccountClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "SignUpController") as! SignUpController
        navigationController?.show(controller, sender: nil)
        
    }
    
}
