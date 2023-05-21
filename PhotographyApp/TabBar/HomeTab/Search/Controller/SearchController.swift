//
//  SearchController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 22.05.2023.
//

import UIKit

class SearchController: UIViewController {
    @IBOutlet private weak var searchText: UITextField!
    @IBOutlet private weak var searchCollection: UICollectionView!
    
    var cellId = "\(HomeCell.self)"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)


     }
  }

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: searchCollection.frame.width, height: searchCollection.frame.height)
    }
}

