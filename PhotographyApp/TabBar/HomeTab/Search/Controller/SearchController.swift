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
    
    var cellId = "\(SearchCell.self)"
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configurData()

     }
    
    func configureUI() {
        searchCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)

    }
    
   func configurData() {
       viewModel.reset()
       searchCollection.reloadData()
       DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
           self.viewModel.fetchData()
       }
    }
    
    @IBAction func SearchText(_ sender: UITextField) {
        viewModel.text = sender.text ?? ""

    }
    
    
  }

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCell
        cell.configureData(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: searchCollection.frame.width  , height: 120)
    }
}

