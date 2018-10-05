//
//  ListViewController.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/27/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

enum contentType : String{
    case text
    case titlenormal
    case blank
}

class ListViewController: UIViewController, ListViewProtocol, UIScrollViewDelegate {
    var presenter: ListViewPresenterProtocol?
    var btnOne: OneBtnViewProtocol?
    var btnTwo: TwoBtnViewProtocol?
    var textCell: TextCellProtocol?
    var blankCell: BlankCellProtocol?
    var titleCell: TitleCellProtocol?
    
    var imageList: [String]? = []
    var contentTemplate: ContentTemplate? = nil
    var contentTable: ContentTemplate? = nil
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var btnBlackItem: UIButton!
    
    @IBOutlet weak var UITableViewDataJSON: UITableView!
    @IBOutlet weak var templateName: UILabel!
    @IBOutlet weak var templateVersion: UILabel!
    @IBOutlet weak var colectionViewSidle: UICollectionView!
    @IBAction func btnBackView(_ sender: Any) {
       self.presenter?.dimistView()
    }
    @IBOutlet weak var UIViewBtn: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBlackItem.setTitle(Constants.namebtnBlack,for: .normal)
        self.colectionViewSidle.delegate = self
        self.colectionViewSidle.dataSource = self
        self.UITableViewDataJSON.delegate = self
        self.UITableViewDataJSON.dataSource = self
        
        colectionViewSidle.register(UINib.init(nibName: Constants.ListlCollectionViewCell , bundle: nil), forCellWithReuseIdentifier: Constants.ListlCollectionViewCell)
        
        UITableViewDataJSON.register(UINib(nibName: Constants.TextCell, bundle: nil), forCellReuseIdentifier: Constants.TextCell)
        UITableViewDataJSON.register(UINib(nibName: Constants.TitleCell, bundle: nil), forCellReuseIdentifier: Constants.TitleCell)
        UITableViewDataJSON.register(UINib(nibName: Constants.BlankCell, bundle: nil), forCellReuseIdentifier: Constants.BlankCell)

        self.getImageJSONLocal()
        CustomImageView()
        btnView()
        
        tableHeight.constant = self.view.frame.height-64
        self.UITableViewDataJSON.isScrollEnabled = false
        //no need to write following if checked in storyboard
        self.scrollView.bounces = false
        self.UITableViewDataJSON.bounces = true
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if self.UITableViewDataJSON.contentOffset.y == self.scrollView.contentOffset.y {
                UITableViewDataJSON.isScrollEnabled = true
            }
        }
    }
   
    func btnView() {
        // TemplateBtn
        guard let path = Bundle.main.path(forResource: Constants.fileNameJsonContentTemplate, ofType: Constants.formatFileJson) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try! Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let btn = Mapper<ContentTemplate>().map(JSONObject: json)
            
            self.contentTemplate = btn
            self.UITableViewDataJSON.reloadData()

//        if let customView = Bundle.main.loadNibNamed("OneBtnView", owner: self, options: nil)?.first as? OneBtnView{
            if let customView = Bundle.main.loadNibNamed(Constants.TwoBtnView, owner: self, options: nil)?.first as? TwoBtnView{
                
                self.UIViewBtn.addSubview(customView)
                customView.frame = UIViewBtn.bounds
                customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                
//              customView.labelImageOneButtton.text = btn?.templateBtn?.cancel?.first?.textKey
//              customView.btnImageOneButton.setBackgroundImage(UIImage(named: (btn?.templateBtn?.cancel?.first?.icon) ?? "btn_cancel"), for: .normal)
                customView.labelImageButtton.text = btn?.templateBtn?.new?.first?.textKey
                customView.labelImageTwoButtton.text = btn?.templateBtn?.new?[1].textKey
                
                customView.btnImageButton.setBackgroundImage(UIImage(named: (btn?.templateBtn?.new?.first?.icon) ?? Constants.nameImageCancel), for: .normal)
                customView.btnImageTwoButton.setBackgroundImage(UIImage(named: (btn?.templateBtn?.new?[1].icon) ?? Constants.nameImageConfirm), for: .normal)
            }
        }
        catch {
            print(error)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        self.UITableViewDataJSON.tableFooterView = UIView()
        
    }
    
    func CustomImageView() {
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
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func getImageJSONLocal() {
        guard let path = Bundle.main.path(forResource: Constants.fileNameJsonContentTemplate, ofType: Constants.formatFileJson) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try! Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//            print(json)
            // ContentTemplate
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
