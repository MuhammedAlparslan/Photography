//
//  PhotosController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 5.06.2023.
//

import UIKit

class PhotosController: UIViewController {
    //    MARK: - Properties

    @IBOutlet private weak var photosCollectionVIew: UICollectionView!
    let viewModel = WalpaperViewModel()
    let cellId = "\(WalpaperCell.self)"
    
    //    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        configureUI()
        
    }
    
    
    //    MARK: - Helper
    
    private func configureViewModel() {
        viewModel.getPhotoWalpaper()
        viewModel.successCallback = {
            self.photosCollectionVIew.reloadData()
        }
    }
    
    private func configureUI() {
        navigationItem.title = "Walpaper"
        navigationItem.titleView?.tintColor = .white
        
    }
    
}

//  MARK:  - PhotosControllerCollectionView

extension PhotosController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WalpaperCell
        cell.configureData(data: viewModel.items[indexPath.item])
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 10, height: 250)

    }
    
}

   

