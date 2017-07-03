# Intro

## Problem at hand

In order to inject dependencies to view controller, it is common to use one of the following pattern:

* `prepare(for segue: UIStoryboardSegue, sender: Any?)` in a parent view controller (with storyboard)
* custom initalisers (no storyboard)

**However**, the above solutions do not clearly isolate each view controllers. As each of the view controllers
will have to understand how the next one works in order to inject their dependencies.

You then end up with a dependency graph that will look like this:

    ViewControllerA <- ViewControllerB <- ViewControllerC <- etc.

It is then very hard to launch only `ViewControllerC` from somewhere else in the application
as it obtains its dependencies from `ViewControllerB` which also needs `ViewControllerA` for its own dependencies.

## Proposed Solution

`StoryboardController` provides you with a mechanism to inject dependencies into view controllers that are initialised
from the storyboard which the controller monitors.

The dependency graph then looks like this:

    StoryboardController <- ViewControllerA
                         <- ViewControllerB
                         <- ViewControllerC

Given this architecture, it is then possible to initialise `ViewControllerC` from somewhere else in the application
without depending on the other 2 view controllers.

