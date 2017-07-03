//  Copyright © 2017 Outware Mobile. All rights reserved.

protocol StoryboardController {

  var storyboardName: String { get }

  func injectDependencies(in viewController: UIViewController)

}

extension StoryboardController {

  var storyboard: UIStoryboard {
    return Storyboard(name: storyboardName, inject: injectDependencies)
  }

}

import UIKit
