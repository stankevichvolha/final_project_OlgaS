//
//  StubTest.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/4/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class StubTests: BaseStubTest {
    
    func testLoginAndLogoutStub(){
      let chatScreen = ChatScreen()
      let channelScreen = chatScreen.openMenu()
        if channelScreen.labelBtnText != "Login" {
            let profileScreen = channelScreen.openProfile()
            profileScreen.logout()
        }
      let loginScreen = channelScreen.login()
        loginScreen.typeUser(email: Session.shared.email)
        loginScreen.type(password: Session.shared.password)
        loginScreen.login()
        XCTAssert(channelScreen.isLoginBtnExists())
        let profileScreen = channelScreen.openProfile()
        XCTAssert(profileScreen.isProfileExists())
        profileScreen.logout()
    }
    
    func testCreateAccountAvalibleForLogedInUser(){
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.openMenu()
        if channelScreen.labelBtnText == "Login"{
            let loginScreen = channelScreen.login()
            loginScreen.typeUser(email: Session.shared.email)
            loginScreen.type(password: Session.shared.password)
            loginScreen.login()
        }
        let addChannelScreen = channelScreen.addChannel()
        XCTAssert(addChannelScreen.isAddChannelScreenExist(), "Create account doesn't avalible")
    }
    
    func testChannelsVisibleForLogedUser(){
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.openMenu()
        if channelScreen.labelBtnText == "Login"{
            let loginScreen = channelScreen.login()
            loginScreen.typeUser(email: Session.shared.email)
            loginScreen.type(password: Session.shared.password)
            loginScreen.login()
        }
        XCTAssert(channelScreen.isChannelNamePressent(text: "#\(Session.shared.channel[0].name)"), "Channels not visible")
    }
    
    
    func testMessageIsDisplayed(){
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.openMenu()
        if channelScreen.labelBtnText == "Login"{
            let loginScreen = channelScreen.login()
            loginScreen.typeUser(email: Session.shared.email)
            loginScreen.type(password: Session.shared.password)
            loginScreen.login()
            channelScreen.openChat()
        }
        XCTAssert(chatScreen.isMessageExists(message: Session.shared.message[1].messageBody), "Message not visible")
    }
    
    func testCreateAccountUIElements(){
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.openMenu()
        if channelScreen.labelBtnText != "Login" {
            let profileScreen = channelScreen.openProfile()
            profileScreen.logout()
        }
        let loginScreen = channelScreen.login()
        let createAccountScreen = loginScreen.createAnAccount()
        createAccountScreen.typeUser(name: Session.shared.name)
        createAccountScreen.type(email: Session.shared.email)
        createAccountScreen.type(password: Session.shared.password)
        let avatarPickerScreen = createAccountScreen.chooseAvatar()
        avatarPickerScreen.pickAvatar()
        createAccountScreen.chooseBackgroundColor()
        createAccountScreen.createAccount()
        XCTAssert(channelScreen.isLoginBtnExists())
    }
    
}

