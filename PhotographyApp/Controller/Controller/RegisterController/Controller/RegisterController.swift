//
//  RegisterController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 20.05.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD


class RegisterController: UIViewController, UITextFieldDelegate {
    
    //    MARK: - Properies
    
    @IBOutlet private weak var nameText       : UITextField!
    @IBOutlet private weak var usernameText   : UITextField!
    @IBOutlet private weak var emailText      : UITextField!
    @IBOutlet private weak var passwordText   : UITextField!
    @IBOutlet private weak var plusImageButton: UIButton!
    @IBOutlet private weak var fullnameText   : UITextField!
    
    
    private let imagePicker = UIImagePickerController()
    private var profileImage : UIImage?
    var viewModel = RegisterViewModel()
    
    //    MARK: - LIFECycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
    }
    
    //    MARK: - Helper
    
    
    
    func configureUI() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        nameText.borderStyle = UITextField.BorderStyle.none
        nameText.layer.addSublayer(createLayer(frame: .init(x: 0,
                                                            y: nameText.frame.height - 5,
                                                            width: nameText.frame.width,
                                                            height: 1),
                                               color: .white))
        
        usernameText.borderStyle = UITextField.BorderStyle.none
        usernameText.layer.addSublayer(createLayer(frame: .init(x: 0,
                                                                y: usernameText.frame.height - 5,
                                                                width: usernameText.frame.width,
                                                                height: 1),
                                                   color: .white))
        
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
        viewModel.succesCallback = {
            self.navigationController?.popViewController(animated: true)
        }
        viewModel.errorCallback = { error in
            self.makeAlert(titleInput: "WARNING!!", messageInput: error)
            
        }
    }
    
    func createLayer(frame: CGRect, color: UIColor) -> CALayer {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = color.cgColor
        return layer
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert     = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil )
    }
    
    func configureImagePicker() {
        plusImageButton.layer.cornerRadius = 64
        plusImageButton.layer.masksToBounds = true
        plusImageButton.imageView?.contentMode = .scaleAspectFit
        plusImageButton.imageView?.clipsToBounds = true
        plusImageButton.layer.borderColor = UIColor.white.cgColor
        plusImageButton.layer.borderWidth = 3
    }
    
    
    @IBAction func addPhoto(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func finishClicked(_ sender: Any) {
        guard let profileImage  = profileImage          else { return }
        guard let email         = emailText.text        else { return }
        guard let password      = passwordText.text     else { return }
        guard let username      = usernameText.text     else { return }
        guard let fullname      = fullnameText.text     else { return }

        
        
        let credentials = Register(email: email, password: password, username: username, profileImage: profileImage, fullname: fullname)
        
        viewModel.registerUser(credentials: credentials)
        ProgressHUD.show()
        ProgressHUD.animationType = .lineScaling
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            ProgressHUD.dismiss()
        }
    }
}


//MARK: - ImagePickerController

extension RegisterController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        self.profileImage = profileImage
        configureImagePicker()
        self.plusImageButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
}
