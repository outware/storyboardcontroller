# Storyboard Controller

`StoryboardController` provides you with a mechanism to inject dependencies into view controllers that are initialised
from the storyboard which the controller monitors.

## Why is it useful?

In order to inject dependencies into view controllers, it is common to use one of the following patterns:

* `prepare(for segue: UIStoryboardSegue, sender: Any?)` in a parent view controller (with storyboard)
* custom initalisers (no storyboard)

**However**, the above solutions do not clearly isolate each view controllers. As each of the view controllers
will have to understand how the next one works in order to inject their dependencies.

You then end up with a dependency graph that will look like this:

    ViewControllerA <- ViewControllerB <- ViewControllerC <- etc.

It is then very hard to launch only `ViewControllerC` from somewhere else in the application
as it obtains its dependencies from `ViewControllerB` which also needs `ViewControllerA` for its own dependencies.

When using the `StoryboardController`, your dependency graph would now look like this:

    StoryboardController <- ViewControllerA
                         <- ViewControllerB
                         <- ViewControllerC

Given this architecture, it is then possible to initialise `ViewControllerC` and inject its dependencies
without interacting with any of the other view controllers from anywhere in your application.

## Getting started

In order to use `StoryboardController`, please refer to [Carthage](https://github.com/Carthage/Carthage)
on how to include this framework to your project.

Once you've added this framework, you should then be able to use it as follow:

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
```

## Have a question?

If you need any help, please visit our [GitHub issues](https://github.com/michaelloo-outware/storyboardcontroller/issues). Feel free to file an issue if you do not manage to find any solution from the archives.

## Contributing to this project

We would love to see your contribution to this project!

To do so, we have a couple of guidelines to make this process as painless as possible:

1. Fork this repository,
1. Improve stuffs,
1. Run `carthage build --no-skip-current` and fix any issues that arises, and
1. Submit a pull request!
