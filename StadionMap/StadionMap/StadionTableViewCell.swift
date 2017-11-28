//
//  StadionTableViewCell.swift
//  StadionMap
//
//  Created by Muhammad Hilmy Fauzi on 27/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class StadionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lblLokasi: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
