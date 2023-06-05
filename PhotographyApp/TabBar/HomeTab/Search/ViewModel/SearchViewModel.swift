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
    
    var page = 0
    var items = [SearchResult]()
    var search : Search?
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func fetchData() {
        SearchManager.shared.getPhotoSearch(query: text, page: page + 1) { photoList, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let photoList = photoList {
                self.page += 1
                self.search = photoList
                self.items.append(contentsOf: photoList.results ?? [])
                self.successCallback?()
            }
        }
    }
    
    func pagination(index: Int) {
        if (index == items.count - 1) && page <= (search?.totalPages ?? 0) {
            fetchData()
        }
    }
    
    func reset() {
        items.removeAll()
        search = nil
    }
}
