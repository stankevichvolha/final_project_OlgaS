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
    
    override init() {
        super.init()
        visible()
    }
    
    func login() -> LoginScreen{
        tap(loginBtn)
        return LoginScreen()
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
