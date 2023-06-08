//
//  ProfileController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 3.06.2023.
//

import UIKit

class ProfileController: UIViewController {
    
//    MARK: - Proporties
    
    @IBOutlet private weak var profileTableView: UITableView!
    
    let viewModel = ProfileViewModel()

    
    //    MARK: - LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
//    MARK: - Helper
    
    func configureUI() {
        navigationItem.title = "Profile"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let controller = storyboard?.instantiateViewController(identifier: "AccountController") as! AccountController
            navigationController?.show(controller, sender: nil)
        }

        if indexPath.row == 2 {
            let alert = UIAlertController(title: "Warning", message: "Are you sure to log out?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = scene.delegate as? SceneDelegate {
                    UserDefaults.standard.set(false, forKey: "loggedIn")
                    sceneDelegate.setLoginRootController(windowScene: scene)
                }
            }
            let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true, completion: nil)
        }
        
        func rootController() {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = scene.delegate as? SceneDelegate {
                UserDefaults.standard.set(false, forKey: "homNav2")
                sceneDelegate.setTabbarRootController(windowScene: scene)
            }
        }
    }
     
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
