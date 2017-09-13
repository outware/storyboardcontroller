# Storyboard Controller

`StoryboardController` provides you with a mechanism to inject dependencies into view controllers that are initialised
from the storyboard which the controller monitors.

## Why is it useful?

In order to inject dependencies into view controllers, it is common to use one of the following patterns:

* `prepare(for segue: UIStoryboardSegue, sender: Any?)` in a parent view controller (with storyboard)
* custom initalisers (no storyboard)

**However**, the above solutions do not clearly isolate each view controller as each of the them
will have to understand how the next one works in order to inject their dependencies.

You end up with a dependency graph that looks like this:

    ViewControllerA <- ViewControllerB <- ViewControllerC <- etc.

This makes it very hard to launch only `ViewControllerC` from somewhere else in the application
as it obtains its dependencies from `ViewControllerB`, which in turn obtains its dependencies from `ViewControllerA`.

On the other hand, when using the `StoryboardController`, the dependency graph looks like this:

    StoryboardController <- ViewControllerA
                         <- ViewControllerB
                         <- ViewControllerC

which makes it possible to initialise `ViewControllerC` with its dependencies
from anywhere in your application without having to interact with the other view controllers.

## Installation

Currently only supports the iOS platform as it relies on a subclass of `UIStoryboard`.

### Carthage

Add the following to your `Cartfile`:

```
github "michaelloo-outware/storyboardcontroller/
```

Then run `carthage update --platform iOS`.

Follow the current instructions in [Carthage's README](https://github.com/Carthage/Carthage) for up-to-date installation instructions.

## Usage

```swift
final class FooStoryboardController: StoryboardController {

  var storyboardName: String = "Foo"

  func injectDependencies(into viewController: UIViewController) {

    switch viewController {

    case let viewController as BarViewController:
      viewController.viewModel = BarViewModel()

    default: break
    }
  }

}

import StoryboardController
```

## Have a question?

If you need any help, please visit our [GitHub issues](https://github.com/michaelloo-outware/storyboardcontroller/issues). Feel free to file an issue if you do not manage to find any solution from the archives.

## Contributing to this project

We would love to see your contribution to this project!

Here are some steps to make this process as painless as possible:

1. Fork this repository,
1. Improve stuff,
1. Run `carthage build --no-skip-current` and fix any issues that arise, and
1. Submit a pull request!
