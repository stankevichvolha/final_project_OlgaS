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
        if channelScreen.labelBtnText != "Login" {
            let profileScreen = channelScreen.openProfile()
            profileScreen.logout()
        }
        let loginScreen = channelScreen.login()
        loginScreen.login()
        XCTAssert(loginScreen.alertCannotLoginExists(), "Allert 'Can't login' not visible")
        loginScreen.closeCannotLoginAlert()
        loginScreen.typeUser(email: "test")
        loginScreen.login()
        XCTAssert(loginScreen.alertCannotLoginExists(), "Allert 'Can't login' not visible")
        loginScreen.closeCannotLoginAlert()
        loginScreen.clearEmail()
        loginScreen.type(password: "123")
        loginScreen.login()
        XCTAssert(loginScreen.alertCannotLoginExists(), "Allert 'Can't login' not visible")
        
    }
    
    func testCreateAnAccount(){
        let randInt = Int.random(in: 1...10000)
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.openMenu()
        if channelScreen.labelBtnText != "Login" {
            let profileScreen = channelScreen.openProfile()
            profileScreen.logout()
        }
        let loginScreen = channelScreen.login()
        let createAccountScreen = loginScreen.createAnAccount()
        createAccountScreen.typeUser(name: "test\(randInt)")
        createAccountScreen.type(email: "test\(randInt)@test.com")
        createAccountScreen.type(password: "123456")
        let avatarPickerScreen = createAccountScreen.chooseAvatar()
        avatarPickerScreen.pickAvatar()
        createAccountScreen.chooseBackgroundColor()
        createAccountScreen.createAccount()
        XCTAssert(channelScreen.isLoginBtnExists())
        let profileScreen = channelScreen.openProfile()
        XCTAssert(profileScreen.isProfileExists())
    
    }
    
    func testNewMessageAppearsAfterSending() {
        let randInt = Int.random(in: 1...10000)
        let chatScreen = ChatScreen()
        if chatScreen.channelLbl == "Smack" {
            let channelScreen = chatScreen.openMenu()
            let loginScreen = channelScreen.login()
            loginScreen.typeUser(email: "e@2.com")
            loginScreen.type(password: "123456")
            loginScreen.login()
            channelScreen.openChat()
        }
        chatScreen.type(message: "test message \(randInt)")
        chatScreen.sendMessage()
        XCTAssert(chatScreen.isMessageExists(message: "test message \(randInt)"))
    }
    
    func testAddChannel() {
        let randInt = Int.random(in: 1...10000)
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.openMenu()
        if channelScreen.labelBtnText == "Login"{
            let loginScreen = channelScreen.login()
            loginScreen.typeUser(email: "e@2.com")
            loginScreen.type(password: "123456")
            loginScreen.login()
        }
        let addChannelScreen = channelScreen.addChannel()
        addChannelScreen.type(channelName: "chennaltest\(randInt)")
        addChannelScreen.type(description: "new chennal")
        addChannelScreen.createChannel()
        XCTAssert(channelScreen.isChannelNamePressent(text: "#chennaltest\(randInt)"), "Chennal wasn't created")
    }
    
    func testLongMessageVisible() {
        let randInt = Int.random(in: 1...10000)
        let chatScreen = ChatScreen()
        if chatScreen.channelLbl == "Smack" {
            let channelScreen = chatScreen.openMenu()
            let loginScreen = channelScreen.login()
            loginScreen.typeUser(email: "e@2.com")
            loginScreen.type(password: "123456")
            loginScreen.login()
            channelScreen.openChat()
        }
        chatScreen.type(message: "test lo-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-ong message \(randInt)")
        chatScreen.sendMessage()
        takeScreenshot()
        XCTAssert(chatScreen.isMessageExists(message: "test lo-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-ong message \(randInt)"))
        
    }
    
    func takeScreenshot(){
        let screenShot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenShot)
        attachment.lifetime = .keepAlways
        add(attachment)
    }

}

