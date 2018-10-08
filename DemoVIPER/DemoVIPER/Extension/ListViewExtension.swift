//
//  ListViewExtension.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 10/4/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

// MARK:- UICollectionView DataSource
extension ListViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListlCollectionViewCell",for:indexPath as IndexPath) as! ListlCollectionViewCell
        if let image = imageList?[indexPath.row] {
            cell.listViewImage.imageFromUrl(urlString: image)
            //cell.imageView.imageFromUrl(urlString: image)
        } else {
            cell.listViewImage.image = UIImage(named: Constants.nameImageGoogle)
        }
        
        return cell
    }
}

// MARK:- ListViewController Methods
extension ListViewController : UICollectionViewDelegate {
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
    }
    
    private func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: IndexPath) {
    }
}

// MARK:- ListViewController Methods UITableViewDataSource UITableViewDelegate
extension ListViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentTemplate?.templateBody?.templateLines?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let list = self.contentTemplate?.templateBody?.templateLines else {
            return UITableViewCell()
        }
        
        let line = list[indexPath.row]
        
        switch line.columns?.first?.contentType {
        case contentType.titlenormal.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
            cell.labelTitleCell.text = line.columns?.first?.parameter?.title
            cell.labelDescriptionCell.text = line.columns?.first?.parameter?.timeStamp
            cell.labelTitleCell.textColor = self.hexStringToUIColor(hex: line.columns?.first?.parameter?.titleFontColor ?? "#000000")
            cell.labelDescriptionCell.textColor = self.hexStringToUIColor(hex: line.columns?.first?.parameter?.timeStampFontColor ?? "#000000")
            
            let image = UIImage(named: line.columns?.first?.parameter?.icon ?? "btn_cancel")
            cell.imageTitleCell.image = image
            cell.backgroundView?.backgroundColor = self.hexStringToUIColor(hex: line.columns?.first?.parameter?.backgroundColor ?? "#000000")
            //            let image = UIImage(named: "\(line.columns?.first?.parameter?.icon)")
            //            let imageView = UIImageView(image: image)
            //            cell.imageTitleCell.addSubview(imageView)
            
            return cell
        case contentType.text.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
            cell.labelTextCell.text = line.columns?.first?.parameter?.text
            cell.labelTextCell.textColor = self.hexStringToUIColor(hex: line.columns?.first?.parameter?.fontColor ?? "#000000")
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlankCell", for: indexPath) as! BlankCell
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let list = self.contentTemplate?.templateBody?.templateLines else {
            return 0
        }
        
        let line = list[indexPath.row]
        switch line.columns?.first?.contentType {
        case contentType.titlenormal.rawValue:
            return 74.5
        case contentType.text.rawValue:
            return 54
        case contentType.blank.rawValue:
            return 54
        default:
            return 10
        }
    }
    
}
