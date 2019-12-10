//
//  AddChannelScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/5/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class AddChannelScreen: BaseScreen {
    private let channelNameTxt: XCUIElement = app.textFields["nameTxtAddChannelVC"]
    private let descriptionTxt: XCUIElement = app.textFields["chanDescAddChannelVC"]
    private let createChannelBtn: XCUIElement = app.buttons["createChannelBtnAddChannelVC"]
    private let closeBtn: XCUIElement = app.buttons["closeButton"]
    
    func type(channelName:String){
        tap(channelNameTxt)
        type(channelName, to: channelNameTxt)
    }
    
    func type(description:String){
        tap(descriptionTxt)
        type(description,to: descriptionTxt)
    }
    
    func createChannel()
    {
        tap(createChannelBtn)
    }
    
    func isAddChannelScreenExist() -> Bool {
        createChannelBtn.waitForExistence(timeout: timeout)
    }
    
    func close() {
        tap(closeBtn)
    }

}
// MARK: - visible
extension  AddChannelScreen{
    func visible() {
        guard createChannelBtn.waitForExistence(timeout: timeout) else {
            XCTFail("Create account screen is not visible")
            return
        }
    }
}
