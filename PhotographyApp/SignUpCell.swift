//
//  SignUpCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 19.05.2023.
//

import UIKit

class SignUpCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel   : UILabel!
    @IBOutlet weak var titleText    : UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    func configureData(data: String) {
        
    }
    func configureUI() {
        let bottomLines = CALayer()
        bottomLines.frame = CGRect(x: 0.0, y: titleText.frame.height - 5, width: titleText.frame.width, height: 1.0)
        bottomLines.backgroundColor = UIColor.white.cgColor
        titleText.borderStyle = UITextField.BorderStyle.none
        titleText.layer.addSublayer(bottomLines)
    }

}
