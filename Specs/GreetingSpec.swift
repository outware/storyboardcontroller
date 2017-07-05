//  Copyright © 2017 Outware Mobile. All rights reserved.

final class GreetingSpec: XCTestCase {

  func testHelloWorldGreeting() {
    let greeting = Greeting(message: "Hello, world!")
    XCTAssert(greeting.message == "Hello, world!")
  }

}

import XCTest

@testable import OMProject
