//  Copyright © 2017 Outware Mobile. All rights reserved.

final class ViewController: UIViewController {

  @IBOutlet private var greetingLabel: UILabel!

  var greeting: Greeting!

  override func viewDidLoad() {
    super.viewDidLoad()
    greetingLabel.text = greeting.message
  }

}

import UIKit
