//  Copyright © 2017 Outware Mobile. All rights reserved.

final class GreetingFeature: XCTestCase {

  var app: XCUIApplication!

  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }

  func testLaunchScreen() {
    let label = app.staticTexts["Hello, world!"]
    XCTAssert(label.exists)
  }

}

import XCTest
