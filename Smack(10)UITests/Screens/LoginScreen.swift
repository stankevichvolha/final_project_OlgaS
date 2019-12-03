//
//  LoginScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class LoginScreen: BaseScreen {

    private let loginBtn: XCUIElement = app.buttons["loginBtnLoginVC"]
    private let signupBtn: XCUIElement = app.buttons["signUpBtnLoginVC"]
    private let alertCannotLogin: XCUIElement = app.alerts["Can't login"].scrollViews.otherElements.buttons["OK"]
    private let usernameTxt: XCUIElement = app/*@START_MENU_TOKEN@*/.textFields["usernameTxtLoginVC"]/*[[".textFields[\"username\"]",".textFields[\"usernameTxtLoginVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    private let passwordTxt: XCUIElement = app/*@START_MENU_TOKEN@*/.secureTextFields["passwordTxtLoginVC"]/*[[".secureTextFields[\"password\"]",".secureTextFields[\"passwordTxtLoginVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    
    override init(){
        super.init()
        visible()
    }
    func login() {
        tap(loginBtn)
    }
    
    func closeCannotLoginAlert() {
        tap(alertCannotLogin)
    }
    func typeUser(email: String){
        tap(usernameTxt)
        type(email, to: usernameTxt)
    }
    func typePassword(password: String){
        tap(passwordTxt)
        type(password, to: passwordTxt)
    }
    func clearEmail(){
        usernameTxt.clearAndEnterText(text: "")
    }
    func alertCannotLoginExists() -> Bool{
        alertCannotLogin.waitForExistence(timeout: timeout)
    }
}

//MARK: - data change in text field

extension XCUIElement {

    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        self.tap()

        let deleteString = stringValue.map { _ in "\u{8}" }.joined(separator: "")

        self.typeText(deleteString)
        self.typeText(text)
    }

}

//MARK: - visibility

extension LoginScreen {
    private func visible(){
        guard signupBtn.waitForExistence(timeout: 5) else {
            XCTFail("Login s creen is not visible")
            return
        }
        
    }
}
