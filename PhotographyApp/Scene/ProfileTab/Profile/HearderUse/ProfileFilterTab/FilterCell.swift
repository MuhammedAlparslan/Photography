//
//  FilterCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 12.06.2023.
//

import UIKit
import SDWebImage


class FilterCell: UICollectionViewCell {
    
//    MARK: - Properties
    
    var option: ProfileFilterOptions? {
        didSet {
            titleLabel.text = option?.description
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
 
    override var isSelected: Bool {
        didSet {
            titleLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 16) : UIFont.systemFont(ofSize: 14)
            titleLabel.textColor = isSelected ? .twitterBlue  : .lightGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helper
    
    func configureUI() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        titleLabel.center(inView: self)
    }
}
