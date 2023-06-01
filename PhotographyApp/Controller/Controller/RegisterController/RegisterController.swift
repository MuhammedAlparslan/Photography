//
//  RegisterController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 20.05.2023.
//

import UIKit
import ProgressHUD

//MARK: - DelegateProtocol

protocol accountDelegate {
    func setText(email: String, password: String)
}

class RegisterController: UIViewController, UITextFieldDelegate {
    
//    MARK: - LIFECycle
    
    @IBOutlet private weak var nameText     : UITextField!
    @IBOutlet private weak var usernameText : UITextField!
    @IBOutlet private weak var emailText    : UITextField!
    @IBOutlet private weak var passwordText : UITextField!
    @IBOutlet private weak var welcome      : UILabel!
    
    var viewModel = RegisterViewModel()
    var delegateProfile: accountDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
//    MARK: - Helper
    
    
    func configureUI() {
        
        navigationItem.hidesBackButton = true
        
        let nameLines = CALayer()
        nameLines.frame = CGRect(x: 0.0, y: nameText.frame.height - 5, width: nameText.frame.width, height: 1.0)
        nameLines.backgroundColor = UIColor.white.cgColor
        nameText.borderStyle = UITextField.BorderStyle.none
        nameText.layer.addSublayer(nameLines)
        
        let usernameLines = CALayer()
        usernameLines.frame = CGRect(x: 0.0, y: usernameText.frame.height - 5, width: usernameText.frame.width, height: 1.0)
        usernameLines.backgroundColor = UIColor.white.cgColor
        usernameText.borderStyle = UITextField.BorderStyle.none
        usernameText.layer.addSublayer(usernameLines)
        
        let emailLines = CALayer()
        emailLines.frame = CGRect(x: 0.0, y: emailText.frame.height - 5, width: emailText.frame.width, height: 1.0)
        emailLines.backgroundColor = UIColor.white.cgColor
        emailText.borderStyle = UITextField.BorderStyle.none
        emailText.layer.addSublayer(emailLines)
        
        let passwordLines = CALayer()
        passwordLines.frame = CGRect(x: 0.0, y: passwordText.frame.height - 5, width: passwordText.frame.width, height: 1.0)
        passwordLines.backgroundColor = UIColor.white.cgColor
        passwordText.borderStyle = UITextField.BorderStyle.none
        passwordText.layer.addSublayer(passwordLines)
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert     = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil )
    }
    
    
    @IBAction func finishClicked(_ sender: Any) {
        if nameText.text         == ""  {
            makeAlert(titleInput: "ERROR!", messageInput: "Enter your first and last name!")
        } else if emailText.text     == ""  {
            makeAlert(titleInput: "ERROR!", messageInput: "Enter your email address!")
        } else if passwordText.text   == ""  {
            makeAlert(titleInput: "ERROR!", messageInput: "Enter your password!")
        } else {
            ProgressHUD.show()
            ProgressHUD.show(icon: .succeed)
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                ProgressHUD.dismiss()
                
                self.viewModel.accountData.append(RegisterAccount(emailAdress: self.emailText.text ?? "",
                                                                  password: self.passwordText.text ?? ""))
                self.viewModel.callBack = {
                    self.navigationController?.popViewController(animated: true)
                }
                
                self.viewModel.writeToJsonFile()
                
                self.delegateProfile?.setText(email: self.emailText.text ?? "",
                                              password: self.passwordText.text ?? "")
            }
        }
    }
}
