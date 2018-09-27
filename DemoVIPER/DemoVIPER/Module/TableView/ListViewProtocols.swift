//
//  ListViewProtocols.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/27/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol ListViewWireframeProtocol: class {

}
//MARK: Presenter -
protocol ListViewPresenterProtocol: class {
    /* ViewController ->  Presenter*/

}

//MARK: Interactor -
protocol ListViewInteractorOutputProtocol: class {
    
    /* Interactor -> Presenter */

}

protocol ListViewInteractorInputProtocol: class {
    
    var presenter: ListViewInteractorOutputProtocol?  { get set }
    
    /* Presenter -> Interactor */

}

//MARK: View -
protocol ListViewProtocol: class {
    
    var presenter: ListViewPresenterProtocol?  { get set }
    
    /* Presenter -> ViewController */

}
