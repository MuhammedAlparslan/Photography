//
//  LoginController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 19.05.2023.
//

import UIKit
import ProgressHUD

class LoginController: UIViewController, accountDelegate {
    @IBOutlet private weak var passwordText : UITextField!
    @IBOutlet private weak var hidenPassword: UIButton!
    @IBOutlet private weak var emailText    : UITextField!
    
    
    private var keepMyPassword: Bool  = true
    private var coordinator: LoginCoordinator?
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
        coordinator = LoginCoordinator(navigationController: navigationController ?? UINavigationController())

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
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert     = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil )
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
        if emailText.text     == ""  {
            makeAlert(titleInput: "ERROR!", messageInput: "Enter your email address!")
        } else if passwordText.text   == ""  {
            makeAlert(titleInput: "ERROR!", messageInput: "Enter your password!")
        } else {
            ProgressHUD.show()
            ProgressHUD.show(icon: .succeed)
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                ProgressHUD.dismiss()
                
                
                if self.viewModel.accountData.contains(where: {
                    $0.emailAdress == self.emailText.text && $0.password == self.passwordText.text }) {
                    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        if let sceneDeleaget: SceneDelegate = (scene.delegate as? SceneDelegate) {
                            sceneDeleaget.setTabbarRootController(windowScene: scene)
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func createAccountClicked(_ sender: Any) {
        coordinator?.showClickedController()
        
    }
    
}
