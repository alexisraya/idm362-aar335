//
//  ViewController.swift
//  idm362-aar335
//
//  Created by Alexis Raya on 1/19/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var vitamins = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get all current saved vitamins
        self.title = "Home"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup
        
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        updateVitamins()
    }
    
    func updateVitamins() {
        vitamins.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        for x in 0..<count {
            
            if let vitamin = UserDefaults().value(forKey: "vitamin_\(x+1)") as? String{
                vitamins.append(vitamin)
            }
            
        }
        
        tableView.reloadData()
        
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.update = {
            DispatchQueue.main.async {
                self.updateVitamins()
            }
        }
        self.present(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "vitamin") as! VitaminsViewController
        vc.vitamin = vitamins[indexPath.row]
        self.present(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vitamins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = vitamins[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()

            vitamins.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

            tableView.endUpdates()
        }
    }
    
    
}
