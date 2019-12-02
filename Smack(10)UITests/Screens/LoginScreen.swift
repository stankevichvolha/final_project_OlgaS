//
//  LoginScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class LoginScreen {
    static let app = XCUIApplication()
    
    private let loginBtn: XCUIElement = app.buttons["loginBtnLoginVC"]
    let alertCannotLogin: XCUIElement = app.alerts["Can't login"].scrollViews.otherElements.buttons["OK"]
    private let usernameTxt = app/*@START_MENU_TOKEN@*/.textFields["usernameTxtLoginVC"]/*[[".textFields[\"username\"]",".textFields[\"usernameTxtLoginVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    private let passwordTxt = app/*@START_MENU_TOKEN@*/.secureTextFields["passwordTxtLoginVC"]/*[[".secureTextFields[\"password\"]",".secureTextFields[\"passwordTxtLoginVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    
    func login() {
        loginBtn.tap()
    }
    
    func closeCannotLoginAlert() {
        alertCannotLogin.tap()
    }
    func typeUser(email: String){
        usernameTxt.tap()
        usernameTxt.typeText(email)
    }
    func typePassword(password: String){
        passwordTxt.tap()
        passwordTxt.typeText(password)
    }
    func clearEmail(){
        usernameTxt.clearAndEnterText(text: "")
    }
}
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
