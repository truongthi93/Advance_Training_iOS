//
//  HomeViewController.swift
//  DemoVIPER
//
//  Created Anh Tran on 9/19/18.
//  Copyright © 2018 UIT. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class HomeViewController: UIViewController, HomeViewProtocol {
    @IBOutlet weak var collectionViewImage: UICollectionView!
    
    var presenter: HomePresenterProtocol?
    
    var imageList : [SplashbaseImage] = []
    
	override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViewImage.delegate = self
        self.collectionViewImage.dataSource = self
        self.setUpNavigationBar()
        collectionViewImage.register(UINib.init(nibName: Constants.nameImageCollectionViewCell , bundle: nil), forCellWithReuseIdentifier: Constants.nameImageCollectionViewCell)
        
        self.presenter?.fecthLocalImage()
        CustomImage()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func CustomImage() {
        let cellSize = CGSize(width:80 , height:80)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 1
        
        collectionViewImage.setCollectionViewLayout(layout, animated: false)
    }
    
    @objc func deleteAllLocal() {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: Constants.titleShowAlertMessage, message: Constants.showAlertDeleteImage, preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: Constants.buttonShowAlertOK, style: .default, handler: { (action) -> Void in
            // delete UI
            self.imageList.removeAll()
            self.collectionViewImage.reloadData()
            // Delete Local
            self.presenter?.deleteLocal()
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: Constants.buttonShowAlertCancel, style: .cancel) { (action) -> Void in
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)

    }

    @objc func logoutButtonClick() {
        self.presenter?.logOut()
    }
    
    @objc func presentViewImage() {
        self.presenter?.ImageLoad()
    }

    func setUpNavigationBar() {
        self.navigationItem.title = Constants.titleImageListView
        let logout = UIBarButtonItem(title: Constants.titleUIRightBarButtonItem, style: .plain, target: self, action: #selector(HomeViewController.logoutButtonClick))
        self.navigationItem.rightBarButtonItem  = logout
        
        let delete = UIBarButtonItem(title: Constants.titleUILeftBarButtonItem, style: .plain, target: self, action: #selector(HomeViewController.deleteAllLocal))
        
        let viewImage = UIBarButtonItem(title: "View", style: .plain, target: self, action: #selector(HomeViewController.presentViewImage))
        self.navigationItem.leftBarButtonItems  = [delete, viewImage]

    }
    
    func getImageFail() {
        Utility.showAlert(message: Constants.showAlertAPIFail, context: self)
    }
    
    func getImageSuccess(list: [SplashbaseImage]) {
        self.imageList = list
        self.collectionViewImage.reloadData()
    }
    
    func getLocalSuccess(list: [SplashbaseImage]) {
        if list.count > 0{
            self.imageList = list
            self.collectionViewImage.reloadData()
        } else {
            self.presenter?.getImages()
        }
    }
}

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
