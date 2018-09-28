//
//  ListViewRouter.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/27/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

class ListViewRouter: ListViewWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModuleList() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ListViewController(nibName: nil, bundle: nil)
        let interactor = ListViewInteractor()
        let router = ListViewRouter()
        let presenter = ListViewPresenter(interface: view as ListViewProtocol, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    func dimistView() {
         self.viewController?.navigationController?.popViewController(animated: true)
    }

}
