//
//  TextCell.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 10/2/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

protocol TextCellProtocol {

}

class TextCell: UITableViewCell {

    var delegate: TextCellProtocol?
    
    @IBOutlet weak var labelTextCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
