//
//  ConversationTableViewCell.swift
//  DemoNetWorkingWithAlamofire
//
//  Created by Lê Đình Linh on 26/06/2023.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNameUser: UILabel!
    @IBOutlet weak var imgAvt: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
