//
//  ChannelScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class ChannelScreen: BaseScreen {
    
    private let loginBtn = app/*@START_MENU_TOKEN@*/.buttons["loginBtnChannelVC"]/*[[".buttons[\"Login\"]",".buttons[\"loginBtnChannelVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    private let addChannelBtn: XCUIElement = app.buttons["addChannelBtnChannelVC"]
    var labelBtnText  = app.buttons.element(matching: .any, identifier: "loginBtnChannelVC").label.description

    override init() {
        super.init()
        visible()
    }
    func openProfile() -> ProfileScreen {
        tap(loginBtn)
        return ProfileScreen()
    }
    func login() -> LoginScreen {
        tap(loginBtn)
        return LoginScreen()
    }
    func isLoginBtnExists()-> Bool {
        loginBtn.waitForExistence(timeout: 10)
    }
    
    func readLoginBtn()-> String {
        let loginTxt:String = loginBtn.value as! String
        return loginTxt
    }
}

//MARK: - visibility
extension ChannelScreen {
    func visible(){
        guard addChannelBtn.waitForExistence(timeout: timeout) else {
            XCTFail("Channel screen not visible")
            return
        }
    }
}
