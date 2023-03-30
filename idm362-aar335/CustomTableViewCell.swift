//
//  CustomTableViewCell.swift
//  idm362-aar335
//
//  Created by Alexis Raya on 3/29/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var checkSwitch: UISwitch!
    
    @IBOutlet weak var vitaminName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
