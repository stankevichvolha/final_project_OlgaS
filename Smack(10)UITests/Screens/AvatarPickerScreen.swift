//
//  AvatarPickerScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class AvatarPickerScreen: BaseScreen {
    
    private let chooseToneBtn: XCUIElement = app.buttons["Dark"]
    private let avatar: XCUIElement = app.collectionViews.cells.element(boundBy: Int.random(in: 0...27))
    
    override init(){
        super.init()
        visible()
    }
    
    func pickAvatar() {
        tap(avatar)
    }
}
// MARK: - visible
extension AvatarPickerScreen{
    func visible() {
        guard chooseToneBtn.waitForExistence(timeout: timeout) else {
            XCTFail("Create account screen is not visible")
            return
        }
    }
}
