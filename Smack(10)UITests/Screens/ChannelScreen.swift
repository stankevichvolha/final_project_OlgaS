//
//  ChannelScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class ChannelScreen: BaseScreen {
    
    private let loginBtn: XCUIElement = app/*@START_MENU_TOKEN@*/.buttons["loginBtnChannelVC"]/*[[".buttons[\"Login\"]",".buttons[\"loginBtnChannelVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    private let addChannelBtn: XCUIElement = app.buttons["addChannelBtnChannelVC"]
    private let menuBtn: XCUIElement = app/*@START_MENU_TOKEN@*/.buttons["menuBtnChatVC"]/*[[".buttons[\"smackBurger\"]",".buttons[\"menuBtnChatVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
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
    func openChat(){
        tap(menuBtn)

    }
    func addChannel()-> AddChannelScreen {
        sleep(2)
        tap(addChannelBtn)
        return AddChannelScreen()
    }
    
    func isChannelNamePressent(text: String) -> Bool{
        if BaseScreen.app.staticTexts[text].waitForExistence(timeout: 5){
            return true
        } else {
            return false
        }
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
