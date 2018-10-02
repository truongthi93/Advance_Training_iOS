//
//  TwoBtnView.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 10/1/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

class TwoBtnView: UIView {

    @IBOutlet weak var btnImageButton: UIButton!
    @IBOutlet weak var btnImageTwoButton: UIButton!
    @IBOutlet weak var labelImageButtton: UILabel!
    @IBOutlet weak var labelImageTwoButtton:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
