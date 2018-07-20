//  Copyright © 2015 Outware Mobile. All rights reserved.

import StoryboardController
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow? = UIWindow()

  func applicationDidFinishLaunching(_ application: UIApplication) {

    let storyboardController: StoryboardController = MainStoryboardController()
    let viewController = storyboardController.storyboard.instantiateInitialViewController()

    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }

}
