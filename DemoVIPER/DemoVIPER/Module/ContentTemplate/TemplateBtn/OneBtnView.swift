//
//  OneBtnView.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 10/1/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

class OneBtnView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnImageOneButton: UIButton!
    @IBOutlet weak var labelImageOneButtton: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
    private func commonInt() {
        //we're going to do stuff here
        Bundle.main
        .loadNibNamed("OneBtnView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
