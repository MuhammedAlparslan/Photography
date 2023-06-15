//
//  AccountController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 11.06.2023.
//

import UIKit

class AccountController: UICollectionViewController, ProfileHearderDelegate {
    func handleDismissal() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //    MARK: - Properties
    
    var viewModel = AccountViewModel()
    
    private let cellID = "AccountCell"
    private var headerIdenfier = "ProfileHeaders"
    
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureViewModel()
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
        
        collectionView.register(UINib(nibName: "\(AccountCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(AccountCell.self)")
        collectionView.register(ProfileHeaders.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdenfier)
    }
    
    func configureViewModel() {
        viewModel.fetchUser()
        viewModel.getPhotoItems()
        viewModel.successCallback = {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension AccountController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data.count

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AccountCell
        cell.configureData(data: viewModel.data[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension AccountController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdenfier, for: indexPath) as! ProfileHeaders
        header.user = viewModel.item
        header.delegate = self
         return header
    }
}


// MARK: - UICollectionViewDelegateFlowLayout


extension AccountController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 10, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
}

