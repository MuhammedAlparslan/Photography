//
//  NetworkHelper.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import Foundation


class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    let baseUrl       = "https://api.unsplash.com/"
    let apiKey        = "uXBf6zf_PfSYdoPYJAR4SSOEg8MRf8jrtCS_BSrwXNw"
    
    func urlConfiqure(path: String) -> String {
        baseUrl + path + "?client_id=\(apiKey)"
        
    }
}
