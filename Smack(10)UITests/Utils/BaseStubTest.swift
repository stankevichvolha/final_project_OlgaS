//
//  BaseStubTest.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/3/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//
import Embassy
import EnvoyAmbassador
import Foundation
import XCTest

class BaseStubTest: XCTestCase {
    private let ipAddress = "http://[::1]"
        private let port = 8383

        private var server: DefaultHTTPServer?

        override func setUp() {
            super.setUp()
            startStubServer()
            launchApp()
            continueAfterFailure = false
        }

        func launchApp() {
            let app = XCUIApplication()
            app.launchArguments = ["deleteAllData"]
            app.launchEnvironment["TEST_BASE_URL"] = "\(ipAddress):\(port)/v1/"
            app.launch()
        }

        override func tearDown() {
            super.tearDown()
            server?.stopAndWait()
        }

        func startStubServer() {
            do {
                let loop = try SelectorEventLoop(selector: try KqueueSelector())
                let router = SmackRouter()
                server = DefaultHTTPServer(eventLoop: loop, port: port, app: router.app)

                // Start HTTP server to listen on the port
                try server?.start()

                // Run event loop
                DispatchQueue.global(qos: .background).async {
                    loop.runForever()
                }
            } catch {
                print("Server error")
            }
        }

    }


