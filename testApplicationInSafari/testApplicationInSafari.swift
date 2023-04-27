////
////  testApplicationInSafari.swift
////  testApplicationInSafari
////
////  Created by Артем Парфенов on 27.04.2023.
////
//
//import XCTest
//
//class testApplicationInSafari: XCTestCase {
//    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
//
//    override func setUpWithError() throws {
//        continueAfterFailure = false
//        safari.launch()
//    }
//
//    override func tearDownWithError() throws {
//        safari.terminate()
//    }
//
//    func testSafari() throws {
//        let app = XCUIApplication()
//        _ = safari.wait(for: .runningForeground, timeout: 30)
//        safari.buttons["URL"].tap()
//        safari.typeText("www.google.com")
//        safari.keyboards.buttons["Go"].tap()
//        _ = app.wait(for: .runningForeground, timeout: 5)
//    }
//
//}
