//
//  customTableViewCell.swift
//  Challenger2
//
//  Created by Matheus Zanivan on 24/03/22.
//

import UIKit

class customTableViewCell: UITableViewCell {
    @IBOutlet var labelAutor : UILabel!
    @IBOutlet var labelNome : UILabel!
    @IBOutlet var labelCategoria : UILabel!
    @IBOutlet var cellView : UIView!
    @IBOutlet var statusImage : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cellView.layer.cornerRadius = 17
        self.cellView.layer.borderWidth = 0
        self.cellView.layer.borderColor = UIColor.black.cgColor
        cellView.layer.masksToBounds = true
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
