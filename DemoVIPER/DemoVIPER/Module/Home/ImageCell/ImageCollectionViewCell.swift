//
//  ImageCollectionViewCell.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/24/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

protocol DataCollectionProtocol {
    func deleteImage(indx: Int)
}

class ImageCollectionViewCell: UICollectionViewCell {

    var delegate: DataCollectionProtocol?
    var index: IndexPath?
    
    @IBAction func btnDeleteImage(_ sender: Any) {
        delegate?.deleteImage(indx: (index?.row)!)
    }
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
