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
    

    @IBAction func btnBackView(_ sender: Any) {
       self.presenter?.dimistView()
    }

    @IBOutlet weak var colectionViewSidle: UICollectionView!
    
    var imageListView : [IframeProperty] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.colectionViewSidle.delegate = self as? UICollectionViewDelegate
        self.colectionViewSidle.dataSource = self as? UICollectionViewDataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   
}
