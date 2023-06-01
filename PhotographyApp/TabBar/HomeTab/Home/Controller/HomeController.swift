//
//  HomeController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 20.05.2023.
//

import UIKit
import PanModal

class HomeController: UIViewController {
    @IBOutlet private weak var homeCollection: UICollectionView!
    
//    MARK: - LIFECYCLE
    
    var viewModel = HomeViewModel()
    var cellId = "\(HomeCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
    }
    
//    MARK: - HELPER
    
    func configureUI() {
        homeCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    func configureViewModel() {
        viewModel.getPhotoItems()
        viewModel.successCallback = {
            self.homeCollection.reloadData()
        }
    }
    
    @IBAction func categoryClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "CategoryController") as! CategoryController
        navigationController?.presentPanModal(controller, sourceView: nil)
    }
    
    @IBAction func searchClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "SearchController") as! SearchController
        navigationController?.show(controller, sender: nil)
        
    }
}

//MARK: - HomeControllerCollection

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
        cell.configureData(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: homeCollection.frame.width, height: 430)
    }
}
