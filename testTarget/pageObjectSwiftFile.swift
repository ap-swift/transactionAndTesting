//
//  testSwiftFile.swift
//  testTarget
//
//  Created by Artem Parfenov on 27.04.2023.
//

import Foundation
import XCTest

struct DialogWindowElementsAndFuncs {

    let app = XCUIApplication()

    lazy var elementIcon = app.otherElements["dialogWindow"] // I used in ViewController.swift a property dialogWindow.accessibilityIdentifier = "dialogWindow"

    func checkController(_ text: String) {
        XCTAssert(app.navigationBars[text].staticTexts[text].exists)
    }

    func checkTextOnPage(_ text: String) {
        XCTAssert(app.scrollViews.otherElements.staticTexts[text].exists)
    }

    func checkButtonOnPage(_ text: String) {
        XCTAssert(app/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"AlertController\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.buttons[text].exists)
    }

    func clickButton(_ text: String) {
        app/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"AlertController\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.buttons[text].tap()
    }
}
