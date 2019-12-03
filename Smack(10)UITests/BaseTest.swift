//
//  BaseTest.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {
    
    override func setUp() {
        XCUIApplication().launch()
        continueAfterFailure = false
    }
    
}
