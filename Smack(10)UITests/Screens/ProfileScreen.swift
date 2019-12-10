//
//  ProfileScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/3/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class ProfileScreen: BaseScreen {
    private let logoutBtn: XCUIElement = app.buttons["logautBtnProfileVC"]
    
    override init(){
        super.init()
        visible()
    }
    
    func logout() {
        tap(logoutBtn)
    }
    func isProfileExists() -> Bool {
        logoutBtn.waitForExistence(timeout: timeout)
    }
}
// MARK: - visible
extension ProfileScreen{
    func visible() {
        guard logoutBtn.waitForExistence(timeout: timeout) else {
            XCTFail("Create account screen is not visible")
            return
        }
    }
}
