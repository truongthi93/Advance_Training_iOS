//
//  ListViewPresenter.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/27/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import Foundation

class ListViewPresenter: ListViewPresenterProtocol, ListViewInteractorOutputProtocol {
    weak private var view: ListViewProtocol?
    var interactor: ListViewInteractorOutputProtocol?
    private let router: ListViewWireframeProtocol
    
    init(interface: ListViewProtocol, interactor: ListViewInteractorInputProtocol?, router: ListViewWireframeProtocol) {
        self.view = interface
        self.interactor = interactor as? ListViewInteractorOutputProtocol
        self.router = router
    }
}
