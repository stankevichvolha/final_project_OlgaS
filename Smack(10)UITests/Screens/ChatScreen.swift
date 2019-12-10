//
//  ChatScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//


import XCTest

class ChatScreen: BaseScreen {

    private let menuBtn:  XCUIElement = app/*@START_MENU_TOKEN@*/.buttons["menuBtnChatVC"]/*[[".buttons[\"smackBurger\"]",".buttons[\"menuBtnChatVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    private let messageTxtBox: XCUIElement = app/*@START_MENU_TOKEN@*/.textFields["messageTxtBoxChatVC"]/*[[".textFields[\"Message\"]",".textFields[\"messageTxtBoxChatVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    private let sendBtn: XCUIElement = app.buttons["sendBtnChatVC"]
    private let table = app.tables

    var channelLbl = app.staticTexts.element(matching: .any, identifier: "channelNameLblChatVC").label.description
    
    override init() {
        super.init()
        visible()
    }
    
    func openMenu () -> ChannelScreen {
        tap(menuBtn)
        return ChannelScreen()
    }
    func type(message: String){
        tap(messageTxtBox)
        type(message, to: messageTxtBox)
    }
    func sendMessage(){
        tap(sendBtn)
    }
    
    func isMessageExists(message: String) -> Bool{
        table.staticTexts[message].waitForExistence(timeout: timeout)
    }
    
}

//MARK: - visibility
extension ChatScreen {
    func visible() {
        guard menuBtn.waitForExistence(timeout: timeout) else {
            XCTFail("Chat screen not visible")
            return
        }
    }
}
