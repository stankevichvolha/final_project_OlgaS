//
//  BaseTest.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
// check jenkins

import XCTest

class BaseTest: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["deleteAllData"]
        app.launch()
    }
    
}
