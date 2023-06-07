//
//  LoginController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 19.05.2023.
//

import UIKit
import ProgressHUD
import FirebaseAuth

class LoginController: UIViewController {
    
    //    MARK: - LIFECycle
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
    
    //    MARK: - Helper
    
    
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
        
        
//        guard let email     = emailText.text    else { return }
//        guard let password  = passwordText.text else { return }
//
//        RegisterViewModel.shared.logInUser(withEmail: email, password: password) { (result, error) in
//            if let error = error {
//                print("DEBUG: Error in \(error.description) ")
//                return
//            }
            
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let sceneDelegate: SceneDelegate = (scene.delegate as? SceneDelegate) {
                    UserDefaults.standard.set(true, forKey: "loggedIn")
                    sceneDelegate.setTabbarRootController(windowScene: scene)
                }
            }
        }
    
    
    @IBAction func createAccountClicked(_ sender: Any) {
        coordinator?.showClickedController()
    }
}
    

