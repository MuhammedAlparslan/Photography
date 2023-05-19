//
//  SignUpEController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 20.05.2023.
//

import UIKit

class SignUpEController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var titleText: UITextField!
    
    var delegate: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
     }
    
    func configureUI() {
        titleLabel.text = "Hi \(delegate ?? "") "
        navigationItem.hidesBackButton = true

        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: titleText.frame.height - 3, width: titleText.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        titleText.borderStyle = UITextField.BorderStyle.none
        titleText.layer.addSublayer(bottomLine)

    }
 
    @IBAction func nextClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "SignUpUUController") as! SignUpUUController
        controller.delegate = titleText.text
        navigationController?.show(controller, sender: nil)
    }
    
}
