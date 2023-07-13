//
//  ExampleSpringFadeTabsUITests.swift
//  ExampleSpringFadeTabsUITests
//
//  Created by Azhar Anwar on 7/13/23.
//

import XCTest

final class ExampleSpringFadeTabsUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTabBarSwitching() {
            let tabBar = app.tabBars["springFadeTabBar"]
            
            let firstTab = tabBar.buttons["firstVC"]
            let secondTab = tabBar.buttons["secondVC"]
            let thirdTab = tabBar.buttons["thirdVC"]

            // initially the first tab is selected
            XCTAssertTrue(firstTab.isSelected)
            
            // switch to the second tab and verify
            secondTab.tap()
            XCTAssertTrue(secondTab.isSelected)
            
            // switch to the third tab and verify
            thirdTab.tap()
            XCTAssertTrue(thirdTab.isSelected)
            
            // switch back to the first tab and verify
            firstTab.tap()
            XCTAssertTrue(firstTab.isSelected)
        }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
