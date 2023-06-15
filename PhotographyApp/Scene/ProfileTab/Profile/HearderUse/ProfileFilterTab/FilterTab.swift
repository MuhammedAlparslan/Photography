//
//  FilterTab.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 12.06.2023.
//

import UIKit

//     MARK: - FilterCellDelegateProtocol

protocol FilterCellDelegate:  AnyObject {
    func filterView(_ view: ProfileFilteriew, didselect indexPath: IndexPath)
}

class ProfileFilteriew: UIView {
    
//     MARK: - Properties
    
    private let cellID  = "FilterCell"
    weak var delegate: FilterCellDelegate?

    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate   = self
        cv.dataSource = self
        return cv
    }()
    
    
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
        
        let selectedIndexPath = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .left)
        
        
        addSubview(collectionView)
        collectionView.addConstraintsToFillView(self)
    }
}

// MARK: - UICollectionViewDataSource

extension ProfileFilteriew: UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfileFilterOptions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FilterCell
        
        let option = ProfileFilterOptions(rawValue: indexPath.row)
        cell.option = option
        
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileFilteriew: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileFilteriew: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.filterView(self, didselect: indexPath)
    }
}
