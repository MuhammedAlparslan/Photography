//
//  CategoryController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 21.05.2023.
//

import UIKit
import PanModal

class CategoryController: UIViewController {
    @IBOutlet private weak var categoryTableView: UITableView!
    
     
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
extension CategoryController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
         return cell
    }
    
    
}

extension CategoryController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return categoryTableView
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(40)
    }
}
