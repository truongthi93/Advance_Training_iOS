//
//  TitleCell.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 10/2/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

protocol TitleCellProtocol {
    
}

class TitleCell: UITableViewCell {

    var delegate: TitleCellProtocol?
    
    @IBOutlet weak var imageTitleCell: UIView!
    @IBOutlet weak var labelTitleCell: UILabel!
    @IBOutlet weak var labelDescriptionCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
