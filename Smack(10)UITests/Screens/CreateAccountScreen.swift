//
//  CreateAccountScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest
class CreateAccountScreen: BaseScreen {
    private let usernameTxt: XCUIElement = app.textFields["usernameTxtCreateActVC"]
    private let emailTxt: XCUIElement = app.textFields["emailTxtCreateActVC"]
    private let passwordTxt: XCUIElement = app.secureTextFields["passTxtCreateActVC"]
    private let chooseAvatarBtn: XCUIElement = app.buttons["chooseAvtBtnCreateActVC"]
    private let backgroundColorBtn: XCUIElement = app.buttons["backgraundBtnCreateActVC"]
    private let createAccountBtn: XCUIElement = app.buttons["createAccountBtnCreateActVC"]
    
    override init() {
        super.init()
        visible()
    }
    
    func typeUser(name: String){
        tap(usernameTxt)
        type(name, to: usernameTxt)
    }
    func type(email: String){
        tap(emailTxt)
        type(email, to: emailTxt)
    }
    func type(password: String){
        tap(passwordTxt)
        type(password, to: passwordTxt)
    }
    func chooseAvatar()-> AvatarPickerScreen{
        tap(chooseAvatarBtn)
        return AvatarPickerScreen()
    }
    func chooseBackgroundColor(){
        tap(backgroundColorBtn)
    }
    func createAccount(){
        tap(createAccountBtn)
    }
}

// MARK: - visible
extension CreateAccountScreen {
    func visible() {
        guard chooseAvatarBtn.waitForExistence(timeout: timeout) else {
            XCTFail("Create account screen is not visible")
            return
        }
    }
}
