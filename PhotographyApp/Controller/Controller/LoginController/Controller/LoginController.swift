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
    
    //    MARK: - Properties
    @IBOutlet private weak var passwordText : UITextField!
    @IBOutlet private weak var hidenPassword: UIButton!
    @IBOutlet private weak var emailText    : UITextField!
    
    private var keepMyPassword: Bool  = true
    private var coordinator: LoginCoordinator?
    var viewModel = LoginViewModel()
    
    
    
    //    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
    }
    
    //    MARK: - Helper
    
    
    func configureUI() {
        navigationItem.hidesBackButton = true
        passwordText.isSecureTextEntry = true
        coordinator = LoginCoordinator(navigationController: navigationController ?? UINavigationController())
        
        emailText.borderStyle = UITextField.BorderStyle.none
        emailText.layer.addSublayer(createLayer(frame: .init(x: 0,
                                                                y: emailText.frame.height - 5,
                                                                width: emailText.frame.width,
                                                                height: 1),
                                                   color: .white))
        
        passwordText.borderStyle = UITextField.BorderStyle.none
        passwordText.layer.addSublayer(createLayer(frame: .init(x: 0,
                                                                y: passwordText.frame.height - 5,
                                                                width: passwordText.frame.width,
                                                                height: 1),
                                                   color: .white))
    }
    
    func configureViewModel() {
        viewModel.errorCallback = { error in
            self.makeAlert(titleInput: "WARNING!!!", messageInput: error)
        }
        
        viewModel.successCallback = {
            ProgressHUD.show()
            ProgressHUD.animationType = .singleCirclePulse
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                ProgressHUD.dismiss()
                
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    if let sceneDelegate: SceneDelegate = (scene.delegate as? SceneDelegate) {
                        UserDefaults.standard.set(true, forKey: "loggedIn")
                        sceneDelegate.setTabbarRootController(windowScene: scene)
                    }
                }
            }
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert     = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil )
    }
    
    func createLayer(frame: CGRect, color: UIColor) -> CALayer {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = color.cgColor
        return layer
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
        guard let email     = emailText.text    else { return }
        guard let password  = passwordText.text else { return }
        
        viewModel.signIn(with: LoginUserRequest(email: email, password: password))
    }

    
    @IBAction func createAccountClicked(_ sender: Any) {
        coordinator?.showClickedController()
    }
}
    

