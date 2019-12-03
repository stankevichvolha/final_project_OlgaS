//
//  Smack_10_UITests.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class Smack_10_UITests: BaseTest {


    func testAtemptToLoginWithoutEmailOrPassword() {
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.openMenu()
        let loginScreen = channelScreen.login()
        loginScreen.login()
        XCTAssert(loginScreen.alertCannotLoginExists(), "Allert 'Can't login' not visible")
        loginScreen.closeCannotLoginAlert()
        loginScreen.typeUser(email: "test")
        loginScreen.login()
        XCTAssert(loginScreen.alertCannotLoginExists(), "Allert 'Can't login' not visible")
        loginScreen.closeCannotLoginAlert()
        loginScreen.clearEmail()
        loginScreen.typePassword(password: "123")
        loginScreen.login()
        XCTAssert(loginScreen.alertCannotLoginExists(), "Allert 'Can't login' not visible")
        
    }

}

