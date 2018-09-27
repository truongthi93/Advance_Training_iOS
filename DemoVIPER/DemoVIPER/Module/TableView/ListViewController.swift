//
//  ListViewController.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/27/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class ListViewController: UIViewController, ListViewProtocol {
    var presenter: ListViewPresenterProtocol?
    var imageList: [String]? = []

    @IBOutlet weak var templateName: UILabel!
    @IBOutlet weak var templateVersion: UILabel!
    @IBOutlet weak var colectionViewSidle: UICollectionView!
    
    @IBAction func btnBackView(_ sender: Any) {
       self.presenter?.dimistView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.colectionViewSidle.delegate = self
        self.colectionViewSidle.dataSource = self
        
        colectionViewSidle.register(UINib.init(nibName: "ListlCollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: "ListlCollectionViewCell")
//        ListlCollectionViewCell.resizableSnapshotView(UIScreen)
        
        self.getImageJSONLocal()
        
        //Image View UICollectionView horizontal paging
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = colectionViewSidle.frame.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        
        colectionViewSidle.setCollectionViewLayout(layout, animated: false)
        colectionViewSidle.isPagingEnabled = true
        colectionViewSidle.alwaysBounceVertical = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func getImageJSONLocal() {
        guard let path = Bundle.main.path(forResource: "ContentTemplate", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try! Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(json)
            
            let user = Mapper<ContentTemplate>().map(JSONObject: json)
            print(user?.templateID ?? "")
            self.templateName.text = user?.templateID
            self.templateVersion.text = "\(String(describing: user?.templateVersion ?? 0))"
            self.imageList = user?.templateBody?.iframeProperty?.images
            self.colectionViewSidle.reloadData()
        }
        catch {
            print(error)
        }
    }

}

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

// MARK:- HomeViewController Methods
extension ListViewController : UICollectionViewDelegate {
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
    }
    
    private func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: IndexPath) {
    }
}
