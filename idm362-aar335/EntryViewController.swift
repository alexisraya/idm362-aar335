//
//  EntryViewController.swift
//  idm362-aar335
//
//  Created by Alexis Raya on 3/12/23.
//

import UIKit

class EntryViewController:
    UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveVitamin()
        return true
    }
    
    @IBAction func saveVitamin(){
        guard let text = field.text, !text.isEmpty else{
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "vitamin_\(newCount)")
        
        update?()
        
        //navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
    
}
