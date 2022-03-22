//
//  DetailTableCell.swift
//  Challenger2
//
//  Created by Vinicius Gomes on 22/03/22.
//

import UIKit

class DetailTableCell: UITableViewCell {

    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var Titlelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
