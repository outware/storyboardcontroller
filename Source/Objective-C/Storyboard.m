//  Copyright © 2015 Outware Mobile. All rights reserved.

#import "Storyboard.h"

@interface Storyboard ()
@property (nullable, nonatomic, readonly) void (^inject)(UIViewController * _Nonnull);
@end

@implementation Storyboard

- (nonnull instancetype)initWithName:(nonnull NSString *)name bundle:(NSBundle *)bundle inject:(void (^)(UIViewController * _Nonnull))inject {
  self = (id)[self.class storyboardWithName:name bundle:bundle];
  _inject = [inject copy];
  return self;
}

- (nonnull instancetype)initWithName:(nonnull NSString *)name inject:(void (^)(UIViewController * _Nonnull))inject {
  self = (id)[self.class storyboardWithName:name bundle:nil];
  _inject = [inject copy];
  return self;
}

- (nonnull instancetype)initWithName:(nonnull NSString *)name bundle:(NSBundle *)bundle {
  return (self = (id)[self.class storyboardWithName:name bundle:bundle]);
}

- (nonnull instancetype)initWithName:(nonnull NSString *)name {
  return (self = (id)[self.class storyboardWithName:name bundle:nil]);
}

- (instancetype)init {
  [self doesNotRecognizeSelector:_cmd];
  return self;
}

#pragma mark Dependency injection

- (UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)identifier {
  UIViewController *viewController = [super instantiateViewControllerWithIdentifier:identifier];

  if (self.inject) {
    for (UIViewController *next in [self allChildViewControllersOfViewController:viewController]) {
      self.inject(next);
    }
  }

  return viewController;
}

- (NSArray<UIViewController *> *)allChildViewControllersOfViewController:(UIViewController *)viewController {

  NSMutableArray<UIViewController *> *viewControllers = @[viewController].mutableCopy;

  for (UIViewController *_viewController in viewController.childViewControllers) {
    [viewControllers addObject:_viewController];

    if (_viewController.childViewControllers.count > 0) {
      [self allChildViewControllersOfViewController:_viewController];
    }
  }

  return viewControllers;
}

@end

