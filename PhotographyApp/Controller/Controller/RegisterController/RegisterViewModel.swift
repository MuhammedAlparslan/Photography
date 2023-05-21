//
//  RegisterViewModel.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 20.05.2023.
//

import Foundation
import UIKit
 

class RegisterViewModel {
    
    static let shared = RegisterViewModel()
    var accountData = [RegisterAccount]()
    var callBack: (() -> ())?
    
    func getFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path = docDirectory.appendingPathComponent("Account.json")
        return path
    }

    
    func writeToJsonFile() {
        do {
            let data = try JSONEncoder().encode(accountData)
            try data.write(to: getFilePath())
            self.callBack?()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readDataFromFile() {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                accountData = try JSONDecoder().decode([RegisterAccount].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File Not Found")
        }
    }
}
