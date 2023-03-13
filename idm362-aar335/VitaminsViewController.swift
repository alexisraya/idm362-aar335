//
//  VitaminsViewController.swift
//  idm362-aar335
//
//  Created by Alexis Raya on 3/12/23.
//

import UIKit

class VitaminsViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var vitamin: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = vitamin
        
    }
    
    @objc func deleteVitamin(){
//        let newCount = count - 1
//
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().set(nil, forKey: "vitamin_\(currentPosition)")
    }
    

}
