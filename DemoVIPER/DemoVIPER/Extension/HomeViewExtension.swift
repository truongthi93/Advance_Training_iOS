//
//  HomeViewExtension.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 10/5/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit


// MARK:- UICollectionView DataSource
extension HomeViewController : UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.nameImageCollectionViewCell,for:indexPath as IndexPath) as! ImageCollectionViewCell
        if let image = imageList[indexPath.row].url {
            cell.imageView.imageFromUrl(urlString: image)
            cell.index = indexPath
            cell.delegate = self
        } else {
            cell.imageView.image = UIImage(named: Constants.nameImageGoogle)
        }
        return cell
    }
}

// MARK:- HomeViewController Methods
extension HomeViewController : UICollectionViewDelegate {
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
    }
    
    private func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: IndexPath) {
    }
}

// MARK:- HomeViewController Methods
extension HomeViewController: DataCollectionProtocol {
    func deleteImage(indx: Int) {
        imageList.remove(at: indx)
        collectionViewImage.reloadData()
    }
    
}
