//
//  Smack_10_UITests.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class Smack_10_UITests: XCTestCase {

    override func setUp() {
      
        continueAfterFailure = false

    }

    override func tearDown() {

    }

    
    let app = XCUIApplication()

    func testExample() {
        let app = XCUIApplication()
        app.launch()

        app/*@START_MENU_TOKEN@*/.buttons["menuBtnChatVC"]/*[[".buttons[\"smackBurger\"]",".buttons[\"menuBtnChatVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["loginBtnChannelVC"]/*[[".buttons[\"Login\"]",".buttons[\"loginBtnChannelVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["loginBtnLoginVC"].tap()
        app.alerts["Can't login"].scrollViews.otherElements.buttons["OK"].tap()
        app/*@START_MENU_TOKEN@*/.textFields["usernameTxtLoginVC"]/*[[".textFields[\"username\"]",".textFields[\"usernameTxtLoginVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.textFields["usernameTxtLoginVC"]/*[[".textFields[\"username\"]",".textFields[\"usernameTxtLoginVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("test")
        app.buttons["loginBtnLoginVC"].tap()
        app.alerts["Can't login"].scrollViews.otherElements.buttons["OK"].tap()
        app.textFields["usernameTxtLoginVC"].clearAndEnterText(text: "")
        app/*@START_MENU_TOKEN@*/.secureTextFields["passwordTxtLoginVC"]/*[[".secureTextFields[\"password\"]",".secureTextFields[\"passwordTxtLoginVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.secureTextFields["passwordTxtLoginVC"]/*[[".secureTextFields[\"password\"]",".secureTextFields[\"passwordTxtLoginVC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("123")
        app.buttons["loginBtnLoginVC"].tap()
        let okButton = app.alerts["Can't login"].scrollViews.otherElements.buttons["OK"]
        XCTAssert(okButton.waitForExistence(timeout: 5), "Allert not visible")
        
    }

}
extension XCUIElement {

    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        self.tap()

        let deleteString = stringValue.map { _ in "\u{8}" }.joined(separator: "")

        self.typeText(deleteString)
        self.typeText(text)
    }

}
