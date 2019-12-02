//
//  Smack_10_UITests.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class Smack_10_UITests: XCTestCase {
      let app = XCUIApplication()

    override func setUp() {
        app.launch()
        continueAfterFailure = false

    }

    override func tearDown() {

    }

    func testCannotLoginWithoutEmailOrPasswordAlert() {
        let chatScreen = ChatScreen()
        chatScreen.openMenu()
        
        let channelScreen = ChannelScreen()
        channelScreen.login()
        let loginScreen = LoginScreen()
        loginScreen.login()
        XCTAssert(loginScreen.alertCannotLogin.waitForExistence(timeout: 5), "Allert not visible")
        loginScreen.closeCannotLoginAlert()
        loginScreen.typeUser(email: "test")
        loginScreen.login()
        XCTAssert(loginScreen.alertCannotLogin.waitForExistence(timeout: 5), "Allert not visible")
        loginScreen.closeCannotLoginAlert()
        loginScreen.clearEmail()
        loginScreen.typePassword(password: "123")
        loginScreen.login()
        XCTAssert(loginScreen.alertCannotLogin.waitForExistence(timeout: 5), "Allert not visible")
        
    }

}

