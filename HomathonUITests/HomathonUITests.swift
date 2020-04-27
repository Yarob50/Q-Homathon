//
//  HomathonUITests.swift
//  HomathonUITests
//
//  Created by يعرب المصطفى on 4/20/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import XCTest

class HomathonUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testExample() throws {
        
        let app = XCUIApplication()
        app.buttons["دخول"].tap()
        sleep(5)
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["المتاجر"].tap()
        sleep(5)
        snapshot("01Stores")
        
        tabBarsQuery.buttons["مواعيدي"].tap()
        sleep(5)
        snapshot("02Appointments")
        
        tabBarsQuery.buttons["الهوية"].tap()
        sleep(5)
        snapshot("03Id")
            
    }
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
