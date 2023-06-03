//
//  DiscoveryController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 25.05.2023.
//

import UIKit

class DiscoveryController: UIViewController {
    @IBOutlet private weak var discoveryCollection: UICollectionView!
    
    //    MARK: - LifeCycle
    
    var viewModel   = DiscoverViewModel()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         configureViewModel()
    }
    
    
    // MARK: - HELPER
    
    func configureViewModel() {
        viewModel.getRandomPhoto()
        viewModel.successCallback = {
            self.discoveryCollection.reloadData()
        }
    }
}

//MARK: - DiscoveryCollection

extension DiscoveryController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoveryCell", for: indexPath) as! DiscoveryCell
        cell.configureData(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: discoveryCollection.frame.width, height:  discoveryCollection.frame.height)
    }
}
