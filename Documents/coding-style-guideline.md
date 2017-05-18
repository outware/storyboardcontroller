# Coding Style Guide

## Organization

At high level, the project is structured as:

- Project
    - Frameworks
    - Products
    - Resources
    - Source
    - Specs
    - Supporting Files

`Source` holds project source code categorized based on features.

`Specs` holds project unit tests categorized based on corresponding features.

## Indentation

Use `Spaces` for indentation with a tab width of 2 spaces. Change Xcode indentation preference in `Text Editing > Indentation`.

## Syntax

### Copyright and Imports

```swift
//  Copyright © 2016 Outware Mobile. All rights reserved.

extension AppDelegate {

  func integrateSDKs() {
    SDKPlugger.plugSDKs([HockeySDK()]).analysis(
      ifSuccess: {
        dprint("\(self.dynamicType): completed \($0.count) out of \(1) integrations")
      },
      ifFailure: {
        fatalError("unexpected failed integration: \($0)")
    })
  }

}

import Foundation
```

```swift
//  Copyright © 2016 Outware Mobile. All rights reserved.

final class SDKPluggerSpec: QuickSpec {

  override func spec() {

    describe("plugSDK") {

      it("succeeds when all integrations are successful") {
        var pluggable = false

        SDKPlugger.plugSDKs([PluggableTestSDK()]).analysis(
          ifSuccess: { _ in pluggable = true },
          ifFailure: { _ in }
        )

        expect(pluggable).toEventually(beTruthy())
      }

      it("fails when one integration fails") {
        var pluggable = true

        SDKPlugger.plugSDKs([PluggableTestSDK(), UnpluggableTestSDK()]).analysis(
          ifSuccess: { _ in pluggable = true },
          ifFailure: { _ in pluggable = false }
        )

        expect(pluggable).toEventually(beFalsy())
      }

    }

  }

}

// MARK: Mocks

private class PluggableTestSDK: SDKPluggable {
  func plug() -> Result<(), MiraqleError> {
    return .Success()
  }
}

private class UnpluggableTestSDK: SDKPluggable {
  func plug() -> Result<(), MiraqleError> {
    return .Failure(MiraqleError())
  }
}

import Nimble
import Quick
import Result

@testable import miraqle
```

### Control Flows

```swift
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}
```

### Functions

```swift
// multiple parameters
func application(
  application: UIApplication,
  didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool
{
  integrateSDKs()

  return true
}

// single parameter
func integrateSDKs() {

  SDKPlugger.plugSDKs([HockeySDK()]).analysis(
    ifSuccess: {
      dprint("\(self.dynamicType): completed \($0.count) out of \(1) integrations")
    },
    ifFailure: {
      fatalError("unexpected failed integration: \($0)")
  })
}
```

## Patterns for optimal compile times

Profiling of Swift compile times has revealed patterns that improve compile times significantly.

### Lazy variable definitions

Lazy variables defined using closures can take a long time to compile. Instead of:

```swift
lazy var lazySignalProducer: SignalProducer<Bool, NoError> = { [unowned self] in
  // return SignalProducer here
}()
```

Prefer:

```swift
lazy var lazySignalProducer: SignalProducer<Bool, NoError> = self.setUpLazySignalProducer()

private func setUpLazySignalProducer() -> SignalProducer<Bool, NoError> {
  // return SignalProducer here
}
```

### Dictionary definitions

Defining a nested `Dictionary`, or `Dictionary` containing inline calculations can take a long time to compile. Define the contents of a `Dictionary` externally, and prefer a strictly typed `Dictionary` over `NSDictionary` where possible. Instead of:

```swift
let parentDictionary: NSDictionary = [
  "value": optionalString ?? "",
  "childDictionary": [
    "childValue": 42
  ]
]
```

Prefer below. It's not pretty, but compiles significantly faster.

```swift
let value = optionalString ?? ""

let childDictionary: [String: Int] = [
  "childValue": 42
]

let parentDictionary: [String: AnyObject] = [
  "value": value,
  "childDictionary": childDictionary
]
```
