//
//  LoginViewControllerTest.swift
//  DemoVIPERTests
//
//  Created by Bao Ngo Mau on 10/8/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import XCTest
@testable import DemoVIPER

class LoginViewControllerTest: XCTestCase {
    
    var vcLogin: LoginViewController!
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_username_password() {

    }
    
    func testBtnLogin() {
        let btnLogin = LoginViewController()
        btnLogin.showAlert()
    }
    
}
