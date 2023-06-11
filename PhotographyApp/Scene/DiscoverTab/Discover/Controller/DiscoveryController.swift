//
//  DiscoveryController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 25.05.2023.
//

import UIKit

class DiscoveryController: UIViewController {
    
    //    MARK: - Properties
    @IBOutlet private weak var discoveryCollection: UICollectionView!
    
    var viewModel   = DiscoverViewModel()
    var cellID      = "\(TopicCell.self)"
    
    
    //    MARK: - LifeCycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
    }
    
 
    
    // MARK: - HELPER

    
    func configureUI() {
        discoveryCollection.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        navigationItem.title = "Category"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .darkText
        
    }
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TopicCell
        cell.configureData(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotosController") as! PhotosController
        controller.viewModel.walpaperId = viewModel.items[indexPath.row].id ?? ""
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: discoveryCollection.frame.width, height: 430)

    }
}

//extension DiscoveryController: PinterestLayoutDelegate {
//    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
//        var height: CGFloat = 0.0
//        DispatchQueue.global().async {
//            if let imageURL = URL(string: self.viewModel.items[indexPath.item].coverPhoto?.urls?.small ?? "") {
//                if let imageData = try? Data(contentsOf: imageURL) {
//                    DispatchQueue.main.async {
//                        if let image = UIImage(data: imageData) {
//                            height = image.size.height
//                        }
//                    }
//                }
//            }
//        }
//        return height
//    }
//}
