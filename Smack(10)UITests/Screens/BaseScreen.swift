//
//  BaseScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class BaseScreen {
    static let app = XCUIApplication()
    
    let timeout: Double = 5.0
    
    func tap(_ element: XCUIElement) {
        element.tap()
    }
    
    func type (_ text: String, to element: XCUIElement) {
        element.typeText(text)
    }
}
