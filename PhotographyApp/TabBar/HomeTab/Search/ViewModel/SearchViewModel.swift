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
    var search : Search?
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func fetchData() {
        SearchManager.shared.getPhotoSearch(query: text, page: (search?.totalPages ?? 0)) { photoList, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let photoList = photoList {
                self.items = photoList.results ?? []
                self.successCallback?()
            }
        }
    }
    
    func pagination(index: Int) {
        if (index == items.count - 1 ) && (( search?.totalPages ?? 0 ) != 0) {
            fetchData()
        }
    }
    
    func reset() {
        items.removeAll()
        search = nil
    }
}
