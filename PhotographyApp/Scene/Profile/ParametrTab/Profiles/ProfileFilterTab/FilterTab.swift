//
//  FilterTab.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 12.06.2023.
//

import UIKit

private let cellID  = "FilterCell"

protocol FilterCellDelegate:  AnyObject {
    func filterView(_ view: ProfileFilteriew, didselect indexPath: IndexPath)
}


class ProfileFilteriew: UIView {
    
//     MARK: - Properties
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    weak var delegate: FilterCellDelegate?
    
//     MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helper
    
    func configureUI() {
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: cellID)
        
        
        addSubview(collectionView)
        collectionView.addConstraintsToFillView(self)
    }
}

// MARK: - Extension

extension ProfileFilteriew: UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FilterCell
        return cell
    }
}

extension ProfileFilteriew: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ProfileFilteriew: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.filterView(self, didselect: indexPath)
    }
}
