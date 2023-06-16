//
//  SearchController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 22.05.2023.
//

import UIKit

class SearchController: UIViewController {
    
    //    MARK: - Properties

    @IBOutlet private weak var searchText: UITextField!
    @IBOutlet private weak var searchCollection: UICollectionView!
    
    private let refreshController = UIRefreshControl()
    
    var cellId = "\(SearchCell.self)"
    var viewModel = SearchViewModel()
    var searching = false

    
//    MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureData()
    }
    
    func configureUI() {
        searchCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        searchCollection.refreshControl = refreshController
        searchCollection.refreshControl?.tintColor = .white
        
    }
    
    func configureData() {
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.searchCollection.reloadData()
        }
    }
    
    @objc func pullToRefresh() {
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

// MARK: - SearchControllerCollection

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCell
        if let urls = viewModel.items[indexPath.item].coverPhoto?.urls {
            cell.configureImage(data: urls)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 10, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
}
