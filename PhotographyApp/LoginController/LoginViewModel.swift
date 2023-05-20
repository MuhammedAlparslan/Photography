//
//  LoginViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 20.05.2023.
//

import Foundation


class LoginViewModel {
    
    var accountData   = [RegisterAccount]()
    static let shared = LoginViewModel()
    
    func getFilePath() -> URL {
        let paths        = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path         = docDirectory.appendingPathComponent("Account.json")
        return path
    }
    
    func readDataFromFile() {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                accountData = try JSONDecoder().decode([RegisterAccount].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File not found")
        }
    }
}

