//  Copyright © 2017 Outware Mobile. All rights reserved.

/// Protocol which provides a mechanism to inject dependencies
/// into view controllers that are initialised
/// from the storyboard with the given name.
public protocol StoryboardController {

  var storyboardName: String { get }

  func injectDependencies(into viewController: UIViewController)

}

public extension StoryboardController {

  var storyboard: UIStoryboard {
    return Storyboard(name: storyboardName, inject: injectDependencies)
  }

}

import UIKit
