//
//  ChannelScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class ChannelScreen {
    
    static let app = XCUIApplication()
    
    private let loginBtn: XCUIElement = app/*@START_MENU_TOKEN@*/.buttons["loginBtnChannelVC"]/*[[".buttons[\"Login\"]",".buttons[\"loginBtnChannelVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    
    func login() {
        loginBtn.tap()
    }
    
    
}
