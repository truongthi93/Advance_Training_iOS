//
//  OneBtnView.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 10/1/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

protocol OneBtnViewProtocol {
    func nameLabel(name: String)
}

class OneBtnView: UIView {

    var delegate: OneBtnViewProtocol?
    var name = IndexPath?.self
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnImageOneButton: UIButton!
    @IBOutlet weak var labelImageOneButtton: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
