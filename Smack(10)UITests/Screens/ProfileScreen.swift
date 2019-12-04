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
    
    func logout() {
        tap(logoutBtn)
    }
    func isProfileExists() -> Bool {
        logoutBtn.waitForExistence(timeout: timeout)
    }
}
