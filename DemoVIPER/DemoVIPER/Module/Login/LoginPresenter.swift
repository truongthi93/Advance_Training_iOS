//
//  LoginPresenter.swift
//  DemoVIPER
//
//  Created Thi Vo on 2018/9/19.
//  Copyright © 2018 UIT. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {
    weak private var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    private let router: LoginWireframeProtocol

    init(interface: LoginViewProtocol, interactor: LoginInteractorInputProtocol?, router: LoginWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }


    func btnLoginClick() {
        self.interactor?.callAPILogin()
    }
    
    func okButtonAlertClick() {
        self.router.moveToHome()
    }
    
    func loginSucess() {
        self.view?.loginSuccess()
    }
}