//
//  ListViewController.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/27/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, ListViewProtocol {
    
    var presenter: ListViewPresenterProtocol?
    
    @IBOutlet weak var colectionViewSidle: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   
}
