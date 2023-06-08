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

class RegisterController: UIViewController, UITextFieldDelegate {
    
    //    MARK: - Properies
    
    @IBOutlet private weak var nameText       : UITextField!
    @IBOutlet private weak var usernameText   : UITextField!
    @IBOutlet private weak var emailText      : UITextField!
    @IBOutlet private weak var passwordText   : UITextField!
    @IBOutlet private weak var plusImageButton: UIButton!
    
    private let imagePicker = UIImagePickerController()
    private var profileImage : UIImage?
    let viewModel = RegisterViewModel()
    
    //    MARK: - LIFECycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
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
    
    func configureLines(text: UITextField, lines: CALayer) {
        text.frame = CGRect(x: 0.0, y: text.frame.height - 5, width: text.frame.width, height: 1.0)
        lines.backgroundColor = UIColor.white.cgColor
        text.borderStyle = UITextField.BorderStyle.none
        text.layer.addSublayer(lines)
        
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func finishClicked(_ sender: Any) {
        guard let profileImage  = profileImage          else { return }
        guard let email         = emailText.text        else { return }
        guard let password      = passwordText.text     else { return }
        guard let username      = usernameText.text     else { return }
        
        
        let credentials = Register(email: email, password: password, username: username, profileImage: profileImage)
        
        RegisterViewModel.shared.registerUser(credentials: credentials) { (error, ref) in
            if let error = error {
                self.makeAlert(titleInput: "WARNING!!", messageInput: error.localizedDescription)
            } else  {
                self.navigationController?.popViewController(animated: true)
            }
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
