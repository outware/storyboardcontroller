//  Copyright © 2017 Outware Mobile. All rights reserved.

final class ViewController: UIViewController {

  @IBOutlet private var greetingLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    greetingLabel.text = Greeting.hello
  }

}

struct Greeting {

  static let hello: String = "Hello, world!"

  private init() { }

}

import UIKit
