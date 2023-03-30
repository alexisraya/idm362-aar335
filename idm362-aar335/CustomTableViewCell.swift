//
//  CustomTableViewCell.swift
//  idm362-aar335
//
//  Created by Alexis Raya on 3/29/23.
//

import UIKit

import AVFoundation

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var checkSwitch: UISwitch!
    
    @IBOutlet weak var vitaminName: UILabel!

    var myAudioPlayerObj = AVAudioPlayer()
    let mySound = Bundle.main.path(forResource: "achievement", ofType: "mp3")!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        do {
          myAudioPlayerObj = try
          AVAudioPlayer(contentsOf: URL(fileURLWithPath: mySound))
          myAudioPlayerObj.prepareToPlay()
          print("Sound file loaded and prepped!")
        } catch {
          print(error)
        }
    }
    
    @IBAction func switchFunc(_ sender: Any) {
        if(checkSwitch.isOn){
            myAudioPlayerObj.play()
        }
    }
    

}
