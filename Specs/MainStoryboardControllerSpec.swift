//Copyright © 2017 Outware Mobile. All rights reserved.

final class MainStoryboardControllerSpec: XCTestCase {

  private var storyboardController: StoryboardController!

  override func setUp() {
    super.setUp()

    storyboardController = MainStoryboardController()
  }

  override func tearDown() {
    storyboardController = nil

    super.tearDown()
  }

  func testInjectingDependency() {

    let viewController: ViewController! = storyboardController.storyboard.instantiateInitialViewController() as? ViewController

    XCTAssert(viewController?.greeting.message == "Hello, world!")
  }

  func testNoDependency() {

    let viewController: UIViewController? = storyboardController.storyboard
      .instantiateViewController(withIdentifier: "EmptyViewController")

    XCTAssertNotNil(viewController)
  }

}

import XCTest

@testable import StoryboardController
