//
//  LoginProtocols.swift
//  DemoVIPER
//
//  Created Thi Vo on 2018/9/19.
//  Copyright © 2018 UIT. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol LoginWireframeProtocol: class {
    func moveToHome()
}
//MARK: Presenter -
protocol LoginPresenterProtocol: class {

    var interactor: LoginInteractorInputProtocol? { get set }
    func btnLoginClick()
    func okButtonAlertClick()
}

//MARK: Interactor -
protocol LoginInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func loginSucess()
}

protocol LoginInteractorInputProtocol: class {

    var presenter: LoginInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func callAPILogin()
}

//MARK: View -
protocol LoginViewProtocol: class {

    var presenter: LoginPresenterProtocol?  { get set }
    /* Presenter -> ViewController */
    func loginSuccess()
}
