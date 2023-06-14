//
//  AccountController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 11.06.2023.
//

import UIKit

private let cellID = "AccountCell"
private var headerIdenfier = "ProfileHeaders"


class AccountController: UICollectionViewController {
    
//    MARK: - Properties
    
 //    MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()

    }
    
    init() {
           super.init(collectionViewLayout: UICollectionViewFlowLayout())
       }
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    
//    MARK: - Helper
    
    
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(AccountCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(ProfileHeaders.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdenfier)
        
        
    }
    
    
}

// MARK: - UICollectionViewDataSource

extension AccountController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AccountCell
        cell.backgroundColor = .red
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension AccountController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdenfier, for: indexPath) as! ProfileHeaders
         return header
    }
}


// MARK: - UICollectionViewDelegateFlowLayout


extension AccountController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
}

