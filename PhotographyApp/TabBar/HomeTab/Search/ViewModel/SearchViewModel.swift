//
//  SearchViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 22.05.2023.
//

import Foundation

class SearchViewModel {
    var text = String() {
        didSet {
            fetchData()
        }
    }
    
    var items = [SearchResult]()
    var photo : Search?
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func fetchData() {
        SearchManager.shared.getPhotoSearch(query: text) { photoList, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let photoList = photoList {
//                self.items.append(contentsOf: photoList.results ?? [])
                self.items = photoList.results ?? []
                self.successCallback?()
            }
        }
    }
    
    func reset() {
        items.removeAll()
        photo = nil
    }
}
