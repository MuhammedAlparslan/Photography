//
//  LoginController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 19.05.2023.
//

import UIKit

class LoginController: UIViewController, accountDelegate {
    @IBOutlet private weak var passwordText : UITextField!
    @IBOutlet private weak var hidenPassword: UIButton!
    @IBOutlet private weak var emailText    : UITextField!
    
    
    private var keepMyPassword   :    Bool          = true
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.readDataFromFile()
        
    }
    
    func setText(email: String, password: String) {
        emailText.text      = email
        passwordText.text   = password
    }
    
    func configureUI() {
        navigationItem.hidesBackButton = true

        let passwordLines = CALayer()
        passwordLines.frame = CGRect(x: 0.0, y: passwordText.frame.height - 5, width: passwordText.frame.width, height: 1.0)
        passwordLines.backgroundColor = UIColor.white.cgColor
        passwordText.borderStyle = UITextField.BorderStyle.none
        passwordText.layer.addSublayer(passwordLines)
        
        let emailLines = CALayer()
        emailLines.frame = CGRect(x: 0.0, y: emailText.frame.height - 5, width: emailText.frame.width, height: 1.0)
        emailLines.backgroundColor = UIColor.white.cgColor
        emailText.borderStyle = UITextField.BorderStyle.none
        emailText.layer.addSublayer(emailLines)
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
