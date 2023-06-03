//
//  ProfileController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 3.06.2023.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet private weak var profileTableView: UITableView!
    
    //    MARK: - LifeCycle
    
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - ProfileControllerExtension


extension ProfileController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
        cell.configureData(data: viewModel.profiles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
