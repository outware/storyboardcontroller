//  Copyright © 2017 Outware Mobile. All rights reserved.

final class GreetingSpec: XCTestCase {

  func testHelloWorldGreeting() {
    let greeting = Greeting.hello
    XCTAssert(greeting == "Hello, world!")
  }

}

import XCTest

@testable import StoryboardControllerExample
