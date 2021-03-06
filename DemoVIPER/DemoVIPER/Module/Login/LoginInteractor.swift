//
//  LoginInteractor.swift
//  DemoVIPER
//
//  Created Thi Vo on 2018/9/19.
//  Copyright © 2018 UIT. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginInteractor: LoginInteractorInputProtocol {
    func callAPILogin() {
        // Alamofire....
        self.presenter?.loginSucess()
    }
    

    weak var presenter: LoginInteractorOutputProtocol?
}
